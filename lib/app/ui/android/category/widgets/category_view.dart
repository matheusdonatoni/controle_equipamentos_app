import 'package:controle_equipamentos/app/controllers/category_controllers/category_controller.dart';
import 'package:controle_equipamentos/app/ui/android/category/widgets/item_list_tab_view.dart';
import 'package:controle_equipamentos/app/ui/android/category/widgets/sub_category_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView(
    this.tag, {
    Key key,
  }) : super(key: key);

  @override
  final String tag;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller.tabController,
      children: [
        SubCategoryTabView(tag),
        ItemListTabView(tag),
      ],
    );
  }
}
