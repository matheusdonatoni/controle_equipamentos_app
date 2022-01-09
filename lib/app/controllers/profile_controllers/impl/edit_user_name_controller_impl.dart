import 'package:controle_equipamentos/app/data/models/user.dart';
import 'package:controle_equipamentos/app/data/repositories/auth_respository.dart';
import 'package:controle_equipamentos/app/services/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditUserNameControllerImpl extends GetxController with StateMixin<User> {
  AuthServices get _authServices => Get.find();
  AuthRepository get authRepository => Get.find();

  User get user => _authServices.user;
  set user(User val) => _authServices.user = val;

  final formKey = GlobalKey<FormState>();
}
