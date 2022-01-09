import 'package:controle_equipamentos/app/controllers/items_list_controller/items_list_controller.dart';
import 'package:controle_equipamentos/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewItemFloatingActionButton extends GetView<ItemsListController> {
  const AddNewItemFloatingActionButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.hasParent) return const SizedBox.shrink();

    return Obx(
      () => AnimatedOpacity(
        opacity: controller.isNotAtEditMode ? 1.0 : 0.0,
        duration: kDuration,
        child: IgnorePointer(
          ignoring: controller.isAtEditMode,
          child: FloatingActionButton.extended(
            icon: Icon(
              Icons.add,
            ),
            label: Text('Peça'),
            onPressed: () async {
              await controller.createItem();
            },
          ),
        ),
      ),
    );
  }
}
