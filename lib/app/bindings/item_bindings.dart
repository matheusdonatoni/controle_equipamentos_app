import 'package:controle_equipamentos/app/controllers/item_controller/item_controller.dart';
import 'package:controle_equipamentos/app/data/models/helpers/item_arguments.dart';
import 'package:get/get.dart';

class ItemBinding implements Bindings {
  @override
  void dependencies() {
    final ItemArguments args = Get.arguments;

    Get.lazyPut(
      () => ItemController(
        args.item,
        args.parent,
      ),
    );
  }
}
