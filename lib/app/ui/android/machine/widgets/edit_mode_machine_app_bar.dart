import 'package:controle_equipamentos/app/controllers/machine_controllers/machine_category_list_controller.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/app_bars/edit_mode_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditModeMachineAppBar extends GetView<MachineCategoryListController> {
  const EditModeMachineAppBar({Key key}) : super(key: key);

  List<Widget> get singleSelectionActions => [
        IconButton(
          icon: Icon(
            Icons.edit,
          ),
          onPressed: () async => controller.updateCategory(),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => EditModeAppBar(
        counter: controller.selectedTiles.length,
        onClosePress: () async => await controller.onWillPop(),
        singleSelectionActions: singleSelectionActions,
        multiSelectionActions: [
          IconButton(
            icon: Icon(
              Icons.delete,
            ),
            onPressed: () async => await controller.showDeleteCategoryDialog(),
          ),
        ],
      ),
    );
  }
}
