import 'package:controle_equipamentos/app/data/models/user.dart';
import 'package:controle_equipamentos/app/data/repositories/auth_respository.dart';
import 'package:controle_equipamentos/app/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginControllerImpl extends GetxController
    with StateMixin<User> {
  final formKey = GlobalKey<FormState>();

  AuthServices get _authServices => Get.find();

  AuthRepository get authRepository => Get.find();

  String get email => value.email;

  String get password => value.password;

  bool get isNotEmail => !value.email.isEmail;

  Future<bool> get isEmailRegistered async =>
      await authRepository.isEmailRegistered(
        value.email,
      );
  Future<bool> get isEmailNotRegistered async => !await isEmailRegistered;

  Future<bool> get isPasswordCorrect async =>
      await authRepository.isPasswordCorrect(
        value.email,
        value.password,
      ) ??
      false;
  Future<bool> get isPasswordNotCorrect async => !await isPasswordCorrect;

  Future<void> login() async {
    await _authServices.login(value);
  }
}
