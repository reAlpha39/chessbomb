import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dialogs {
  void showRandomNumber({required String title, required String middleText}) {
    Get.defaultDialog(
      title: title,
      middleText: middleText,
      middleTextStyle: const TextStyle(fontSize: 46),
      textConfirm: 'OK',
      confirmTextColor: Colors.black54,
      onConfirm: () => Get.back(),
    );
  }
}