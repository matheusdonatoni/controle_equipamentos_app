import 'package:controle_equipamentos/app/controllers/category_controllers/category_controller.dart';
import 'package:controle_equipamentos/app/ui/android/category/widgets/category_view.dart';
import 'package:controle_equipamentos/app/ui/android/category/widgets/empty_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/category_floating_action_button.dart';
import 'widgets/category_app_bars/category_app_bar.dart';

class CategoryPage extends GetView<CategoryController> {
  CategoryPage({
    Key key,
  }) : super(key: key);

  @override
  final String tag = Get.arguments.category.id.toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CategoryAppBar(tag),
      floatingActionButton: CategoryFloatingActionButton(tag),
      body: controller.obx(
        (state) => CategoryView(tag),
        onEmpty: EmptyCategory(),
      ),
    );
  }
}
