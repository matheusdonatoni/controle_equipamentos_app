import 'dart:async';
import 'package:controle_equipamentos/app/data/models/authentication.dart';
import 'package:controle_equipamentos/app/data/models/user.dart';
import 'package:controle_equipamentos/app/data/repositories/auth_respository.dart';
import 'package:controle_equipamentos/app/routes/routes.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/snackbars/contextual_snackbar.dart';
import 'package:get/get.dart';

class AuthServices extends GetxService {
  AuthRepository get authRepository => Get.find();

  Authentication authentication = Authentication();

  User get user => authentication.user;
  set user(User val) => authentication.user = val;

  Future<void> register(User user) async {
    await authRepository.register(user).then(
      (val) async {
        authentication = val;

        await saveAuthentication(user).then((_) => pushHomeAndOffAll());
      },
      onError: (err) => ContextualSnackbar.info(
        title: 'Erro',
        message: err.toString(),
      ),
    );
  }

  Future<void> login(User user) async {
    await authRepository.login(user).then(
      (val) async {
        authentication = val;

        await saveAuthentication(user).then((_) => pushHomeAndOffAll());
      },
      onError: (err) => ContextualSnackbar.info(
        title: 'Erro',
        message: err.toString(),
      ),
    );
  }

  Future<void> logout() async {
    await cleanCredentials();

    await pushLoginAndOffAll();
  }

  Future<void> cleanCredentials() async {
    await authRepository.cleanAuthentication();

    authentication = Authentication();
    user = User();
  }

  Future<void> saveAuthentication(User user) async {
    await authRepository.saveAuthentication(
      authentication.copyWith(
        user: user,
      ),
    );
  }

  Future<void> pushLoginAndOffAll() async {
    await Get.offAllNamed(
      Routes.LOGIN,
    );
  }

  Future<void> pushHomeAndOffAll() async {
    await Get.offAllNamed(
      Routes.HOME,
    );
  }

  @override
  void onInit() async {
    super.onInit();

    authentication = authRepository.findAuthentication();

    if (authentication.isValidLocally) {
      await login(user).onError((_, __) async => await logout());
    } else {
      await logout();
    }
  }
}
