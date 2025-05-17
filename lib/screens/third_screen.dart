import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/palindrome_controller.dart';

class ThirdScreen extends StatelessWidget{
  final controller = Get.find<PalindromeController>();
  ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Third Screen",
            style: TextStyle(
                fontWeight: FontWeight.w600
            ),
          ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Color(0xFF554AF0)
          ),
          onPressed: () => Get.back(),
        ),
        )
    );
  }


}