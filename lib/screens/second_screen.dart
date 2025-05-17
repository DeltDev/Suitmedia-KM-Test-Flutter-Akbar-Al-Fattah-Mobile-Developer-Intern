import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_km_test_akbar_al_fattah_mobile_developer_intern/screens/third_screen.dart';

import '../controllers/palindrome_controller.dart';

class SecondScreen extends StatelessWidget {
  final controller = Get.find<PalindromeController>();
  SecondScreen({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: const Text(
              "Second Screen",
            style: TextStyle(
              fontWeight: FontWeight.w600
            ),
          ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF554AF0)),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 16
              ),
            ),
            Text(
              controller.name.value.isEmpty ? "Unnamed User" : controller.name.value,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const Spacer(),
            const Center(
              child: Text(
                'Selected User Name',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: const Color(0xFF3A6B75),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                Get.to(() => ThirdScreen(), arguments: controller.name.value);
              },
              child:const Text(
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500
                  ),
                  "Choose a User"
              ),
            ),
          ],
        ),
      )
    );
  }
}