import 'package:controle_equipamentos/app/controllers/home_controllers/home_controller.dart';
import 'package:controle_equipamentos/app/data/models/catalog.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/controllers/getx_controller_impl.dart';
import 'package:controle_equipamentos/app/data/models/unit.dart';
import 'package:controle_equipamentos/app/data/models/user.dart';
import 'package:controle_equipamentos/app/data/repositories/catalog_repository.dart';
import 'package:controle_equipamentos/app/services/auth_services.dart';
import 'package:get/get.dart';

abstract class SettingsControllerImpl extends GetxControllerImpl<User> {
  CatalogRepository get catalogRepository => Get.find();

  AuthServices get _authServices => Get.find();

  Rx<User> get _user => _authServices.authentication.rx.user;
  User get user => _user.value;
  set user(User newValue) => _user.value = newValue;

  Unit get unit => user.unit;

  Catalog get catalog => user.catalog;
  set catalog(Catalog newValue) => user.catalog = newValue;

  bool get hasCatalog => unit.catalog != null;

  @override
  User get initial => user;

  @override
  Stream<User> get stream => _user.stream;
}
