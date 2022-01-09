import 'package:controle_equipamentos/app/services/auth_services.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<AuthServices> {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 56.0),
          child: Loading(),
        ),
      ),
    );
  }
}
