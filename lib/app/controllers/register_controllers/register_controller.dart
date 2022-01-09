import 'package:controle_equipamentos/app/controllers/register_controllers/impl/register_controller_impl.dart';
import 'package:controle_equipamentos/app/data/models/picture.dart';

import 'package:controle_equipamentos/app/data/models/helpers/implementations/controllers/state_mixin_extension.dart';
import 'package:controle_equipamentos/app/data/models/user.dart';

class RegisterController extends RegisterControllerImpl {
  String nameError;
  String emailError;
  String unitError;
  String passwordError;
  String confirmPasswordError;

  void onPictureChanged(Picture picture) {
    value.picture = picture;
  }

  void nameValidator() {
    if (value.name == null) {
      nameError = 'Digite seu nome';
    } else if (value.name.isEmpty) {
      nameError = 'Digite seu nome';
    } else {
      nameError = null;
    }
  }

  Future<void> emailValidator() async {
    if (email == null || email.isEmpty) {
      emailError = 'Digite seu e-mail';
    } else if (isNotEmail) {
      emailError = 'Digite um e-mail valido';
    } else if (await isEmailRegistered) {
      emailError = 'E-mail já cadastrado';
    } else {
      emailError = null;
    }
  }

  void unitValidator() {
    if (value.unit == null) {
      unitError = 'Escolha sua unidade';
    } else {
      unitError = null;
    }
  }

  void passwordValidator() {
    if (password == null) {
      passwordError = 'Digite seu senha';
    } else if (password.isEmpty) {
      passwordError = 'Digite seu senha';
    } else if (password.length < 8) {
      passwordError = 'Senha deve ter ao menos 8 caracteres';
    } else {
      passwordError = null;
    }
  }

  void confirmPasswordValidator() {
    if (confirmPassword == null) {
      confirmPasswordError = 'Confirme sua senha';
    } else if (confirmPassword.isEmpty) {
      confirmPasswordError = 'Confirme sua senha';
    } else if (confirmPassword != value.password) {
      confirmPasswordError = 'As senhas devem ser iguais';
    } else {
      confirmPasswordError = null;
    }
  }

  Future<void> registerValidator() async {
    nameValidator();
    await emailValidator();
    unitValidator();
    passwordValidator();
    confirmPasswordValidator();

    changeToLoadingMore();

    if (formKey.currentState.validate()) {
      await register();
    }

    changeToSuccess();
  }

  @override
  void onInit() {
    super.onInit();

    assign(User());
  }
}
