import 'package:controle_equipamentos/app/data/models/catalog.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/controllers/getx_controller_impl.dart';
import 'package:controle_equipamentos/app/data/models/user.dart';
import 'package:controle_equipamentos/app/services/auth_services.dart';
import 'package:get/get.dart';

abstract class HomeControllerImpl extends GetxControllerImpl<Catalog> {
  AuthServices get _authService => Get.find();

  User get user => _authService.user;

  Rx<Catalog> get _catalog => user.unit.rx.catalog;

  Catalog get catalog => _catalog.value;

  @override
  get initial => catalog;

  @override
  get stream => _catalog.stream;
}
