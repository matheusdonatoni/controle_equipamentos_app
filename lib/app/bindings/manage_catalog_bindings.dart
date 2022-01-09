import 'package:controle_equipamentos/app/controllers/manage_catalog_controllers/manage_catalog_controller.dart';
import 'package:get/get.dart';

class ManageCatalogBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ManageCatalogController(Get.arguments));
  }
}
