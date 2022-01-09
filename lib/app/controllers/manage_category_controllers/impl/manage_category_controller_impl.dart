import 'package:controle_equipamentos/app/controllers/category_controllers/categories_tab_controller.dart';
import 'package:controle_equipamentos/app/controllers/machine_controllers/machine_category_list_controller.dart';
import 'package:controle_equipamentos/app/data/models/category.dart';
import 'package:controle_equipamentos/app/data/models/machine.dart';
import 'package:controle_equipamentos/app/data/repositories/category_repository.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/snackbars/contextual_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ManageCategoryControllerImpl extends GetxController
    with StateMixin<Category> {
  final formKey = GlobalKey<FormState>();

  ManageCategoryControllerImpl(
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

  bool get isOrphan => parent == null;

  Machine get machine =>
      isOrphan ? _machineCategoryListController.machine : null;

  List<Category> get categories => isOrphan
      ? _machineCategoryListController.categories
      : _categoriesTabController.categories;

  int get _index => categories.indexWhere((e) => e.id == reference.id);

  set category(Category newValue) => categories[_index] = newValue;

  bool get isNew => reference.id == null;

  bool get isNotInitialName => value.name != reference.name;

  Future<bool> get isNameUnique async => await categoryRepository
      .isNameUnique(value, machine: machine, parent: parent)
      .catchError(ContextualSnackbar.error);

  Future<bool> get isNameNotUnique async => !await isNameUnique;
}
