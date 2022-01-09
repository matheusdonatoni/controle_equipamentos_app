import 'package:controle_equipamentos/app/controllers/category_controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'item_tab.dart';
import 'sub_category_tab.dart';

class CategoryTabBar extends GetView<CategoryController>
    implements PreferredSizeWidget {
  const CategoryTabBar(this.tag, {Key key}) : super(key: key);

  @override
  final String tag;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller.tabController,
      tabs: [SubCategoryTab(tag), ItemTab(tag)],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(46.0);
}
