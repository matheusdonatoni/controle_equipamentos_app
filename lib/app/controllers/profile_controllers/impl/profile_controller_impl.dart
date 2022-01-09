import 'package:controle_equipamentos/app/data/models/helpers/implementations/controllers/getx_controller_impl.dart';
import 'package:controle_equipamentos/app/data/models/user.dart';
import 'package:controle_equipamentos/app/data/repositories/auth_respository.dart';
import 'package:controle_equipamentos/app/services/auth_services.dart';
import 'package:get/get.dart';

abstract class ProfileControllerImpl extends GetxControllerImpl<User> {
  AuthServices get _authServices => Get.find();
  AuthRepository get authRepository => Get.find();

  Rx<User> get _user => _authServices.authentication.rx.user;

  User get user => _user.value;
  set user(User val) => _user.value = val;

  @override
  get initial => user;

  @override
  get stream => _user.stream;
}
