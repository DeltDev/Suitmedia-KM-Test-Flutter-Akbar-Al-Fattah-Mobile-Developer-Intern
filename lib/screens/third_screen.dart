import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:suitmedia_km_test_akbar_al_fattah_mobile_developer_intern/controllers/user_controller.dart';

import '../controllers/palindrome_controller.dart';

class ThirdScreen extends StatelessWidget{
  final userController = Get.find<UserController>();
  final ScrollController _scrollController = ScrollController();

  ThirdScreen({super.key}) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent &&
          !userController.isLoadingMore.value &&
          !userController.isLoading.value) {
        userController.fetchUsers(); // Load next page
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Screen", style: TextStyle(fontWeight: FontWeight.w600)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF554AF0)),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() {
        if (userController.isLoading.value && userController.users.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (userController.hasError.value && userController.users.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Connection lost. Please check your internet."),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => userController.fetchUsers(refresh: true),
                  child: const Text("Retry"),
                ),
              ],
            ),
          );
        }

        if (userController.users.isEmpty) {
          return const Center(child: Text("No users available."));
        }

        return RefreshIndicator(
          onRefresh: () => userController.fetchUsers(refresh: true),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: userController.users.length + 1,
            itemBuilder: (context, index) {
              if (index == userController.users.length) {
                return Obx(() => userController.isLoadingMore.value
                    ? const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: CircularProgressIndicator()),
                )
                    : const SizedBox());
              }

              final user = userController.users[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: GestureDetector(
                  onTap: () {
                    userController.selectedUserName.value =
                    "${user.firstName} ${user.lastName}";
                    Get.back();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage(user.avatarURL),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${user.firstName} ${user.lastName}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                user.email,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }


}