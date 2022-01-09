import 'package:controle_equipamentos/app/controllers/category_controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'animated_app_bars/animated_category_app_bar.dart';
import 'view_mode_app_bars/view_mode_category_app_bar.dart';

import '../../../../../data/models/helpers/implementations/controllers/state_mixin_extension.dart';

class CategoryAppBar extends GetView<CategoryController>
    with PreferredSizeWidget {
  const CategoryAppBar(
    this.tag, {
    Key key,
  }) : super(key: key);

  final String tag;

  @override
  Widget build(BuildContext context) {
    return controller.simpleObx(
      (state) => AnimatedCategoryAppBar(tag),
      onEmpty: ViewModeCategoryAppBar(tag),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(102.0);
}
