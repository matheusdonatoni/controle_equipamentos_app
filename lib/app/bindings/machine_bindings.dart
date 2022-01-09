import 'package:controle_equipamentos/app/controllers/machine_controllers/machine_category_list_controller.dart';
import 'package:controle_equipamentos/app/controllers/machine_controllers/machine_controller.dart';
import 'package:controle_equipamentos/app/data/repositories/category_repository.dart';
import 'package:get/get.dart';

class MachineBinding implements Bindings {
  @override
  void dependencies() {
    machineDependencies();
    categoryListDependencies();
  }

  void machineDependencies() {
    Get.lazyPut(() => MachineController(Get.arguments));
  }

  void categoryListDependencies() {
    Get.lazyPut(() => CategoryRepository(), fenix: true);

    Get.lazyPut(() => MachineCategoryListController());
  }
}
