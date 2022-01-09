import 'package:controle_equipamentos/app/controllers/home_controllers/impl/home_controller_impl.dart';
import 'package:controle_equipamentos/app/data/models/catalog.dart';
import 'package:controle_equipamentos/app/routes/routes.dart';
import 'package:get/get.dart';

class HomeController extends HomeControllerImpl {
  Future<void> createCatalog() async {
    await Get.toNamed(
      Routes.MANAGE_CATALOG,
      arguments: Catalog(),
    );
  }
}
