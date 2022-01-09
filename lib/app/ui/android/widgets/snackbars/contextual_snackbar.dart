import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContextualSnackbar {
  static void info({String title, String message}) {
    print(message);
    
    Get.rawSnackbar(
      title: title,
      message: message,
      duration: Duration(seconds: 3),
      margin: EdgeInsets.all(12.0),
      borderRadius: 5.0,
    );
  }

  static void error(Object error) {
    info(
      title: 'Erro',
      message: error.toString(),
    );
  }
}
