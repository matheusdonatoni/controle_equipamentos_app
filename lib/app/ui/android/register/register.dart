import 'package:controle_equipamentos/app/controllers/register_controllers/register_controller.dart';
import 'package:controle_equipamentos/app/ui/android/register/widget/register_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registrar',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: RegisterForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
