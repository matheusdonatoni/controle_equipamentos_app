import 'package:controle_equipamentos/app/data/models/user.dart';
import 'package:controle_equipamentos/app/data/repositories/auth_respository.dart';
import 'package:controle_equipamentos/app/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class RegisterControllerImpl extends GetxController
    with StateMixin<User> {
  final formKey = GlobalKey<FormState>();

  AuthServices get _authServices => Get.find();
  AuthRepository get authRepository => Get.find();

  String get email => value.email;
  String get password => value.password;

  bool get isEmail => email.isEmail ?? false;
  bool get isNotEmail => !isEmail;

  Future<bool> get isEmailRegistered async => await authRepository
      .isEmailRegistered(value.email)
      .onError((error, stackTrace) => true);

  String confirmPassword;

  Future<void> register() async {
    _authServices.register(value);
  }
}
