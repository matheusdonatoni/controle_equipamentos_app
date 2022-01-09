import 'package:controle_equipamentos/app/controllers/category_controllers/category_controller.dart';
import 'package:controle_equipamentos/app/ui/android/category/widgets/item_floating_action_button.dart';
import 'package:controle_equipamentos/app/ui/android/category/widgets/sub_category_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/helpers/implementations/controllers/state_mixin_extension.dart';

class CategoryFloatingActionButton extends GetView<CategoryController> {
  const CategoryFloatingActionButton(
    this.tag, {
    Key key,
  }) : super(key: key);
  final String tag;

  @override
  Widget build(BuildContext context) {
    return controller.simpleObx(
      (state) => Obx(() {
        if (controller.index == 0) {
          return SubCategoryFloatingActionButton(tag);
        }

        return ItemFloatingActionButton(tag);
      }),
    );
  }
}
