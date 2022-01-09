import 'package:controle_equipamentos/app/data/models/helpers/implementations/controllers/getx_controller_impl.dart';
import 'package:controle_equipamentos/app/data/models/user.dart';
import 'package:controle_equipamentos/app/services/auth_services.dart';
import 'package:get/get.dart';

abstract class UserSettingsControllerImpl extends GetxControllerImpl<User> {
  AuthServices get _authServices => Get.find();

  Rx<User> get _user => _authServices.authentication.rx.user;

  User get user => _user.value;

  @override
  get initial => user;

  @override
  get stream => _user.stream;
}
