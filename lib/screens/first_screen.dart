import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_km_test_akbar_al_fattah_mobile_developer_intern/screens/second_screen.dart';
import '../controllers/palindrome_controller.dart';
// import 'second_screen.dart';

class FirstScreen extends StatelessWidget{
  final controller = Get.put(PalindromeController());
  FirstScreen({super.key});

  void _showResultDialog(bool isPalindrome) {
    Get.defaultDialog(
      title: 'Palindrome Check Results',
      middleText: isPalindrome ? 'isPalindrome' : 'not palindrome',
      confirm: ElevatedButton(
        onPressed: () => Get.back(),
        child: const Text('OK'),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6EC6CA), Color(0xFFB1BFD8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white24,
                    child: Icon(
                      Icons.person_add,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 40,),
                  //text field untuk name
                  TextField(
                    onChanged: controller.setName,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500
                    ),
                    decoration: InputDecoration(
                      hintText: "Name",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  //text field untuk palindrome
                  TextField(
                    onChanged: controller.setSentence,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500
                    ),
                    decoration: InputDecoration(
                      hintText: "Palindrome",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  //tombol untuk cek palindrome
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: const Color(0xFF3A6B75),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      _showResultDialog(controller.isPalindrome);
                    },
                    child:const Text(
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                        ),
                        "CHECK"
                    ),
                  ),
                  const SizedBox(height: 15,),
                  //tombol untuk ke halaman berikutnya
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: const Color(0xFF3A6B75),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      Get.to(() => SecondScreen(), arguments: controller.name.value);
                    },
                    child:const Text(
                        style: TextStyle(
                          color: Colors.white,
                            fontWeight: FontWeight.w500
                        ),
                        "NEXT"
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}