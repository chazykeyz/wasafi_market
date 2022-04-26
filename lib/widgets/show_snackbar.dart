import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackBar(String message,
    {bool isError = true, String title = "Error"}) {
  Get.snackbar(title, message,
      backgroundColor: Colors.white.withOpacity(.2),
      snackPosition: SnackPosition.TOP,
      borderWidth: 1,
      borderColor: Colors.white.withOpacity(.3),
      colorText: Colors.white);
}
