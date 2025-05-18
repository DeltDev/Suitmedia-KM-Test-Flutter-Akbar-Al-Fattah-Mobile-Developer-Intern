import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:suitmedia_km_test_akbar_al_fattah_mobile_developer_intern/controllers/user_controller.dart';

import '../controllers/palindrome_controller.dart';

class ThirdScreen extends StatelessWidget{
  final userController = Get.find<UserController>();
  ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Third Screen",
            style: TextStyle(
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 1,
          leading: IconButton(
            icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xFF554AF0)
            ), onPressed: () => Get.back(),
          ),
        ),
      body: Obx((){
        if (userController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
            itemCount: userController.users.length,
            itemBuilder: (context, index){
              final user = userController.users[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatarURL),
                ),
                title: Text("${user.firstName} ${user.lastName}"),
                subtitle: Text(user.email),
                onTap: () {
                  userController.selectedUserName.value = "${user.firstName} ${user.lastName}";
                  Get.back();
                },
              );
            }
        );
    }),
    );
  }


}