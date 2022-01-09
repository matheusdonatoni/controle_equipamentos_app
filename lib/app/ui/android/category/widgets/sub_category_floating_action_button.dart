import 'package:controle_equipamentos/app/controllers/category_controllers/categories_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoryFloatingActionButton extends GetView<CategoriesTabController> {
  const SubCategoryFloatingActionButton(
    this.tag, {
    Key key,
  }) : super(key: key);

  final String tag;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () async {
        await controller.createCategory();
      },
      icon: Icon(Icons.add),
      label: Text(
        'Seção',
      ),
    );
  }
}
