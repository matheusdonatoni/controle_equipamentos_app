import 'package:controle_equipamentos/app/controllers/machine_controllers/machine_category_list_controller.dart';
import 'package:controle_equipamentos/app/data/models/category.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/controllers/getx_controller_with_tab_impl.dart';
import 'package:controle_equipamentos/app/data/repositories/category_repository.dart';
import 'package:get/get.dart';

import '../categories_tab_controller.dart';

abstract class CategoryControllerImpl
    extends GetxControllerWithTabImpl<Category> {
  CategoryControllerImpl(
    this.reference,
    this.parent,
  );

  final Category reference;
  final Category parent;

  CategoryRepository get categoryRepository => Get.find();

  MachineCategoryListController get _machineCategoryListController =>
      Get.find();
  CategoriesTabController get _categoriesTabController => Get.find(
        tag: parent.id.toString(),
      );

  RxList<Category> get categories => parent == null
      ? _machineCategoryListController.categories
      : _categoriesTabController.categories;

  int get _index => categories.indexWhere((e) => e.id == reference.id);

  Category get category => _index == -1 ? null : categories[_index];

  @override
  get initial => category;

  @override
  get stream => categories.stream.map(
        (categories) => category,
      );
}
