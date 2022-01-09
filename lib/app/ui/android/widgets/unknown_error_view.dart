import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnknownError extends StatelessWidget {
  const UnknownError({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Erro desconhecido...',
        style: Get.textTheme.headline6,
      ),
    );
  }
}
