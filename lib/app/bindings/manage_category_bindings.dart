import 'package:controle_equipamentos/app/controllers/manage_category_controllers/manage_category_controller.dart';
import 'package:controle_equipamentos/app/data/models/helpers/category_arguments.dart';
import 'package:get/get.dart';

class ManageCategoryBinding extends Bindings {
  @override
  void dependencies() {
    final CategoryArguments args = Get.arguments;

    Get.lazyPut(
      () => ManageCategoryController(
        args.category,
        args.parent,
      ),
    );
  }
}
