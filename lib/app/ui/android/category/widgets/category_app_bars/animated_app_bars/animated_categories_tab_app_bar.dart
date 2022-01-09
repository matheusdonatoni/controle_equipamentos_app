import 'package:controle_equipamentos/app/controllers/category_controllers/categories_tab_controller.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/animations/animated_app_bar_switcher.dart/animated_app_bar_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../category_tab_bar.dart';
import '../edit_mode_app_bars/edit_mode_categories_tab_app_bar.dart';
import '../view_mode_app_bars/view_mode_category_app_bar.dart';

class AnimatedCategoriesTabAppBar extends GetView<CategoriesTabController> {
  const AnimatedCategoriesTabAppBar(
    this.tag, {
    Key key,
  }) : super(key: key);

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedAppBarSwitcher(
        firstAppBar: ViewModeCategoryAppBar(tag),
        secondAppBar: EditModeCategoriesTabAppBar(tag),
        backgroundAppBar: AppBar(
          elevation: 0.0,
          bottom: CategoryTabBar(tag),
        ),
        showFirst: controller.isNotAtEditMode,
      ),
    );
  }
}
