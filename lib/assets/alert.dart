import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'dart:io';
import 'package:get/get.dart';

class Alert {
  void messagevalidation(String message, int duration) {
    Get.snackbar(
      'message',
      message,
      duration: Duration(seconds: duration),
      animationDuration: Duration(milliseconds: 800),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
