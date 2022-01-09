import 'package:controle_equipamentos/app/controllers/item_controller/item_controller.dart';
import 'package:controle_equipamentos/app/ui/android/item/widgets/item_view.dart';
import 'package:controle_equipamentos/app/ui/android/item/widgets/empty_item.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/popup_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/helpers/implementations/controllers/state_mixin_extension.dart';

class ItemPage extends GetView<ItemController> {
  const ItemPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: controller.simpleObx(
          (state) => Text(
            '${state.name}',
          ),
          onEmpty: Text('Peça'),
        ),
        actions: [
          controller.simpleObx(
            (state) {
              if (controller.hasParent) {
                return IconButton(
                  onPressed: () async =>
                      await controller.showDeleteItemDialog(),
                  icon: Icon(Icons.delete),
                );
              }

              return PopupActionButton(
                onSelected: (value) => controller.onActionSelected(
                  value,
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: controller.obx(
          (state) => ItemView(),
          onEmpty: EmptyItem(),
        ),
      ),
    );
  }
}
