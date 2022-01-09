import 'package:controle_equipamentos/app/controllers/manage_machine_controllers/manage_machine_controller.dart';
import 'package:get/get.dart';

class ManageMachineBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ManageMachineController(Get.arguments));
  }
}
