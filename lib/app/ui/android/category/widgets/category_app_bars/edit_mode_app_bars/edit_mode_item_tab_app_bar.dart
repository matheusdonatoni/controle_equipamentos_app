import 'package:controle_equipamentos/app/controllers/category_controllers/items_tab_controller.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/app_bars/edit_mode_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../category_tab_bar.dart';

class EditModeItemsTabAppBar extends GetView<ItemsTabController> {
  const EditModeItemsTabAppBar(
    this.tag, {
    Key key,
  }) : super(key: key);

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => EditModeAppBar(
        counter: controller.selectedTiles.length,
        onClosePress: () async => await controller.onWillPop(),
        bottom: CategoryTabBar(tag),
        multiSelectionActions: [
          IconButton(
            icon: Icon(
              Icons.delete,
            ),
            onPressed: () async => await controller.showRemoveItemDialog(),
          ),
        ],
      ),
    );
  }
}
