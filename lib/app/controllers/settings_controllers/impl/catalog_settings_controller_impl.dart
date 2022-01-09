import 'package:controle_equipamentos/app/data/models/catalog.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/controllers/getx_controller_impl.dart';
import 'package:controle_equipamentos/app/data/models/unit.dart';
import 'package:controle_equipamentos/app/data/models/user.dart';
import 'package:controle_equipamentos/app/data/repositories/catalog_repository.dart';
import 'package:controle_equipamentos/app/services/auth_services.dart';
import 'package:get/get.dart';

abstract class CatalogSettingsControllerImpl
    extends GetxControllerImpl<Catalog> {
  CatalogRepository get catalogRepository => Get.find();

  AuthServices get _authService => Get.find();

  User get _user => _authService.user;
  Unit get _unit => _user.unit;

  Rx<Catalog> get _catalog => _unit.rx.catalog;

  Catalog get catalog => _catalog.value;
  set catalog(Catalog newValue) => _catalog.value = newValue;

  @override
  get initial => catalog;

  @override
  get stream => _catalog.stream;
}
