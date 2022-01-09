import 'package:controle_equipamentos/app/data/models/helpers/implementations/controllers/getx_controller_impl.dart';
import 'package:controle_equipamentos/app/data/models/unit.dart';
import 'package:controle_equipamentos/app/services/auth_services.dart';
import 'package:get/get.dart';

abstract class UnitSettingsControllerImpl extends GetxControllerImpl<Unit> {
  AuthServices get _authServices => Get.find();

  Rx<Unit> get _unit => _authServices.user.rx.unit;

  Unit get unit => _unit.value;

  @override
  get initial => unit;

  @override
  get stream => _unit.stream;
}
