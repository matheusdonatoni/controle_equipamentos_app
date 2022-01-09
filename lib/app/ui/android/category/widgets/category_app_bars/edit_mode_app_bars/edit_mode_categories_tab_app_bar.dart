import 'package:controle_equipamentos/app/controllers/category_controllers/categories_tab_controller.dart';
import 'package:controle_equipamentos/app/ui/android/category/widgets/category_tab_bar.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/app_bars/edit_mode_app_bar.dart';
import 'package:controle_equipamentos/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditModeCategoriesTabAppBar extends GetView<CategoriesTabController> {
  const EditModeCategoriesTabAppBar(
    this.tag, {
    Key key,
  }) : super(key: key);

  final String tag;

  List<Widget> get singleSelectionActions => [
        IconButton(
          icon: Icon(
            Icons.edit,
          ),
          onPressed: () async => controller.updateCategory(),
        ),
      ];

  List<Widget> get animatedSingleSelectionActions => List.generate(
        singleSelectionActions.length,
        (index) => Obx(
          () => AnimatedSwitcher(
            duration: kDuration,
            child: controller.isSingleTileSelected
                ? singleSelectionActions[index]
                : SizedBox.shrink(),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => EditModeAppBar(
        counter: controller.selectedTiles.length,
        onClosePress: () async => await controller.onWillPop(),
        bottom: CategoryTabBar(tag),
        singleSelectionActions: singleSelectionActions,
        multiSelectionActions: [
          IconButton(
            icon: Icon(
              Icons.delete,
            ),
            onPressed: () async =>
                await controller.showDeleteCategoriesDialog(),
          ),
        ],
      ),
    );
  }
}
