import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorView extends StatelessWidget {
  final String error;
  const ErrorView(
    this.error, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error,
        style: Get.textTheme.headline6,
      ),
    );
  }
}
