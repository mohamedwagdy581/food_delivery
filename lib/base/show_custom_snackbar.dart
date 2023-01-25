import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

void showCustomSnackBar(String message, {bool isError = true, String title='Error', Color backgroundColor = Colors.redAccent,})
{
  Get.snackbar(
      title,
      titleText: BigText(text: title, color: Colors.white,),
      message,
    messageText: Text(
        message,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
    backgroundColor: backgroundColor,

  );
}