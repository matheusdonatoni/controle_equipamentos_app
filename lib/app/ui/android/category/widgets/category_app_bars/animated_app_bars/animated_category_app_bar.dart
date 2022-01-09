import 'package:controle_equipamentos/app/controllers/category_controllers/category_controller.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/animations/animated_app_bar_switcher.dart/animated_app_bar_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'animated_categories_tab_app_bar.dart';
import 'animated_items_tab_app_bar.dart';
import '../view_mode_app_bars/view_mode_category_app_bar.dart';

class AnimatedCategoryAppBar extends GetView<CategoryController>
    with PreferredSizeWidget {
  const AnimatedCategoryAppBar(
    this.tag, {
    Key key,
  }) : super(key: key);

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedAppBarSwitcher(
        firstAppBar: AnimatedCategoriesTabAppBar(tag),
        secondAppBar: AnimatedItemsTabAppBar(tag),
        backgroundAppBar: ViewModeCategoryAppBar.withoutElevation(tag),
        showFirst: controller.index == 0,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(102.0);
}
