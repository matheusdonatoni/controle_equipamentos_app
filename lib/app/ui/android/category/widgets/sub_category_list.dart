import 'package:controle_equipamentos/app/controllers/category_controllers/categories_tab_controller.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/tiles/category_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoryList extends GetView<CategoriesTabController> {
  SubCategoryList(
    this.tag, {
    Key key,
  }) : super(key: key);

  @override
  final String tag;

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: state.length,
        itemBuilder: (context, index) {
          var category = state[index];

          return Obx(
            () => CategoryTile(
              onTap: () async {
                await controller.onTileTap(
                  category,
                );
              },
              onLongPress: () async {
                controller.onTileLongPress(
                  category,
                );
              },
              category: category,
              selected: controller.isTileSelected(category),
            ),
          );
        },
      ),
    );
  }
}
