import 'package:get/get.dart';

class PalindromeController extends GetxController{
  var name = ''.obs;
  var sentence = ''.obs;

  void setName(String value) => name.value = value;
  void setSentence(String value) => sentence.value = value;

  bool get isPalindrome {
    final cleaned = sentence.value.replaceAll(RegExp(r'\s+'), '').toLowerCase();
    return cleaned == cleaned.split('').reversed.join('');
  }
}