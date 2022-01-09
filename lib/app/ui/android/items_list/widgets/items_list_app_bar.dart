import 'package:controle_equipamentos/app/controllers/items_list_controller/items_list_controller.dart';
import 'package:controle_equipamentos/app/ui/android/items_list/widgets/view_mode_items_list_app_bar.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/animations/animated_app_bar_switcher.dart/animated_app_bar_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_mode_items_list_app_bar.dart';
import 'edit_mode_items_list_app_bar.dart';

class ItemsListAppBar extends GetView<ItemsListController>
    implements PreferredSizeWidget {
  const ItemsListAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.hasParent) {
      return AddModeItemsListAppBar();
    }

    return Obx(
      () => AnimatedAppBarSwitcher(
        firstAppBar: ViewModeItemsListAppBar(),
        secondAppBar: EditModeItemsListAppBar(),
        showFirst: controller.isNotAtEditMode,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
