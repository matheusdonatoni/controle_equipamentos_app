import 'package:controle_equipamentos/app/controllers/login_controllers/impl/login_controller_impl.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/controllers/state_mixin_extension.dart';
import 'package:controle_equipamentos/app/data/models/user.dart';

import '../../data/models/helpers/implementations/controllers/state_mixin_extension.dart';

class LoginController extends LoginControllerImpl {
  String emailError;
  String passwordError;

  Future<void> emailValidator() async {
    if (email == null || email.isEmpty) {
      emailError = 'Digite seu e-mail';
    } else if (isNotEmail) {
      emailError = 'Digite um e-mail valido';
    } else if (await isEmailNotRegistered ?? false) {
      emailError = 'E-mail não cadastrado';
    } else {
      emailError = null;
    }
  }

  Future<void> passwordValidator() async {
    if (password == null || password.isEmpty) {
      passwordError = 'Digite sua senha';
    } else if ((await isPasswordNotCorrect ?? false) && emailError == null) {
      passwordError = 'Senha incorreta';
    } else {
      passwordError = null;
    }
  }

  Future<void> loginValidator() async {
    await emailValidator();
    await passwordValidator();

    changeToLoadingMore();

    if (formKey.currentState.validate()) {
      await login();
    }

    changeToSuccess();
  }

  @override
  void onInit() {
    super.onInit();

    assign(authRepository.findLatestUser());
  }
}
