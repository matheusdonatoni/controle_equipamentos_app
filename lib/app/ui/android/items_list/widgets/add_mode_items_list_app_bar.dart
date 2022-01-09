import 'package:controle_equipamentos/app/controllers/items_list_controller/items_list_controller.dart';
import 'package:controle_equipamentos/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/action_add_button.dart';

class AddModeItemsListAppBar extends GetView<ItemsListController> {
  const AddModeItemsListAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.close),
        onPressed: () async => await controller.onWillPop(),
      ),
      title: Obx(
        () => AnimatedSwitcher(
          duration: kDuration,
          child: controller.selectedTiles.isEmpty
              ? Text('Adicionar peças')
              : Text('${controller.selectedTiles.length}'),
        ),
      ),
      actions: [
        Obx(
          () => ActionAddButton(
            visible: controller.selectedTiles.isNotEmpty,
            onPressed: () async => controller.onAddPressed(),
          ),
        ),
      ],
    );
  }
}
