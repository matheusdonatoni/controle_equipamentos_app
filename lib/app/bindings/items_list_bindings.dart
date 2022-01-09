import 'package:controle_equipamentos/app/controllers/items_list_controller/items_list_controller.dart';
import 'package:controle_equipamentos/app/data/repositories/category_repository.dart';
import 'package:controle_equipamentos/app/data/repositories/item_repository.dart';
import 'package:get/get.dart';

class ItemsListBinding implements Bindings {
  ItemsListBinding();
  @override
  void dependencies() {
    Get.lazyPut(() => ItemRepository());
    Get.lazyPut(() => CategoryRepository());
    Get.lazyPut(() => ItemsListController(Get.arguments));
  }
}
