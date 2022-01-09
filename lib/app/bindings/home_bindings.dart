import 'package:controle_equipamentos/app/controllers/home_controllers/home_controller.dart';
import 'package:controle_equipamentos/app/controllers/home_controllers/home_drawer_controller.dart';
import 'package:controle_equipamentos/app/controllers/home_controllers/machine_list_controller.dart';
import 'package:controle_equipamentos/app/data/repositories/catalog_repository.dart';
import 'package:controle_equipamentos/app/data/repositories/machine_repository.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    catalogDependencies();
    drawerDependencies();
    machineListDependencies();
  }

  void drawerDependencies() {
    Get.lazyPut(() => HomeDrawerController());
  }

  void catalogDependencies() {
    Get.lazyPut(() => CatalogRepository(), fenix: true);

    Get.lazyPut(() => HomeController());
  }

  void machineListDependencies() {
    Get.lazyPut(() => MachineRepository(), fenix: true);

    Get.lazyPut(() => MachineListController());
  }
}
