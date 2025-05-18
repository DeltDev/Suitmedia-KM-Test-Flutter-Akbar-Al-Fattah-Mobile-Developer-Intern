import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../objects/User.dart';

class UserController extends GetxController{
  var users = <User>[].obs;
  var isLoading = true.obs;
  var selectedUserName = ''.obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }
  void fetchUsers() async {
    try {
      isLoading(true);
      final response = await http.get(
          Uri.parse('https://reqres.in/api/users?page=1&per_page=10'),
        headers: {
            "x-api-key" : "reqres-free-v1",
            "Content-Type" : "application/json",
            "Accept" : "application/json"
          }
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> userList = data['data'];
        users.value = userList.map((json) => User.fromJson(json)).toList();
      } else {
        Get.snackbar("Error", "Failed to load users: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", "Exception: $e");
    } finally {
      isLoading(false);
    }
  }
}