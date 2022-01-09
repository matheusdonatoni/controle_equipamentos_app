import 'package:controle_equipamentos/app/controllers/login_controllers/login_controller.dart';
import 'package:controle_equipamentos/app/ui/android/login/widgets/login_form.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Entrar',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 24.0,
              ),
              SizedBox(
                height: 70,
                child: Logo(),
              ),
              SizedBox(
                height: 24.0,
              ),
              Text(
                'Controle de equipamentos',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 48.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                ),
                child: LoginForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
