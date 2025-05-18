import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../objects/User.dart';

class UserController extends GetxController{
  var users = <User>[].obs;
  var isLoading = true.obs;
  var isLoadingMore = false.obs;
  var currentPage = 1;
  var totalPages = 1;
  var isRefreshing = false.obs;
  var hasError = false.obs;

  var selectedUserName = ''.obs;
  late final Connectivity _connectivity;
  late final Stream<ConnectivityResult> _connectivityStream;

  @override
  void onInit() {
    super.onInit();
    _connectivity = Connectivity();
    _connectivityStream = _connectivity.onConnectivityChanged;
    _connectivityStream.listen(_handleConnectivityChange);

    fetchUsers(refresh: true);
  }

  void _handleConnectivityChange(ConnectivityResult result) {
    if (result != ConnectivityResult.none && hasError.value && users.isEmpty) {
      fetchUsers(refresh: true);
    }
  }

  Future<void> fetchUsers({bool refresh = false}) async {
    if (refresh) {
      currentPage = 1;
      users.clear();
      isRefreshing(true);
    } else {
      if (currentPage > totalPages) return;
      isLoadingMore(true);
    }

    try {
      hasError(false);
      if (!refresh) isLoading(true);

      final response = await http.get(
        Uri.parse('https://reqres.in/api/users?page=$currentPage&per_page=8'),
        headers: {
          "x-api-key": "reqres-free-v1",
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> userList = data['data'];
        totalPages = data['total_pages'] ?? 1;

        final newUsers = userList.map((json) => User.fromJson(json)).toList();

        if (refresh) {
          users.value = newUsers;
        } else {
          users.addAll(newUsers);
        }

        currentPage++;
      } else {
        hasError(true);
        Get.snackbar("Error", "Failed to load users: ${response.statusCode}");
      }
    } catch (e) {
      hasError(true);
      Get.snackbar("Error", "Connection lost. Please check your internet connection.");
    } finally {
      isLoading(false);
      isRefreshing(false);
      isLoadingMore(false);
    }
  }
}