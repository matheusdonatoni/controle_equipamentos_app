import 'package:controle_equipamentos/app/controllers/category_controllers/categories_tab_controller.dart';
import 'package:controle_equipamentos/app/controllers/category_controllers/category_controller.dart';
import 'package:controle_equipamentos/app/controllers/category_controllers/items_tab_controller.dart';
import 'package:controle_equipamentos/app/data/models/helpers/category_arguments.dart';
import 'package:controle_equipamentos/app/data/repositories/item_repository.dart';
import 'package:get/get.dart';

class CategoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ItemRepository(), fenix: true);

    final CategoryArguments args = Get.arguments;

    final tag = args.category.id.toString();

    Get.lazyPut(
      () => CategoryController(
        args.category,
        args.parent,
      ),
      tag: tag,
    );

    Get.lazyPut(
      () => CategoriesTabController(args.category),
      tag: tag,
    );

    Get.lazyPut(
      () => ItemsTabController(args.category),
      tag: tag,
    );
  }
}
