import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final name = Get.arguments as String;

    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen")),
      body: Center(
        child: Text("Hello, $name!", style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}