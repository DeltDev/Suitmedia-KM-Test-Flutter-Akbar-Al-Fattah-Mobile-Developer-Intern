import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:suitmedia_km_test_akbar_al_fattah_mobile_developer_intern/screens/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Palindrome Checker',
      home: FirstScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
