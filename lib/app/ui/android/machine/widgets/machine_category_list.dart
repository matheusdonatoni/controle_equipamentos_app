import 'package:controle_equipamentos/app/controllers/machine_controllers/machine_category_list_controller.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/tiles/category_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MachineCategoryList extends GetView<MachineCategoryListController> {
  const MachineCategoryList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (_) => onData,
      onEmpty: onEmpty,
    );
  }

  Widget get onData => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: 12.0,
              bottom: 12.0,
            ),
            child: Text(
              'Seções',
              style: Get.textTheme.headline6,
            ),
          ),
          WillPopScope(
            onWillPop: controller.onWillPop,
            child: Obx(
              () => ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.categories.length,
                itemBuilder: (context, index) {
                  var category = controller.categories[index];

                  return Obx(
                    () => CategoryTile(
                      selected: controller.isTileSelected(category),
                      onTap: () async => await controller.onTileTap(category),
                      onLongPress: () => controller.onTileLongPress(category),
                      category: category,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      );

  Widget get onEmpty => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text(
          'Este equipamento ainda não foi preenchido com seções.',
          style: Get.textTheme.subtitle1,
        ),
      );
}
