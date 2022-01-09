import 'package:controle_equipamentos/app/controllers/manage_item_controller/manage_item_controller.dart';
import 'package:get/get.dart';

class ManageItemBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ManageItemController(Get.arguments));
  }
}
