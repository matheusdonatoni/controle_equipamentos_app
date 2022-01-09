import 'package:controle_equipamentos/app/controllers/items_list_controller/items_list_controller.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/tiles/item_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilledItemsList extends GetView<ItemsListController> {
  const FilledItemsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: state.length,
        itemBuilder: (context, index) {
          var item = state[index];

          // Category child tile;
          if (controller.itemBelongsToParent(item)) {
            return IgnorePointer(
              ignoring: true,
              child: ItemTile(
                key: ObjectKey(item),
                item: item,
                selected: true,
                color: Colors.grey[600],
                onTap: () {},
              ),
            );
          }

          // Non-category child tile;
          return Obx(
            () => ItemTile(
              key: ObjectKey(item),
              item: item,
              selected: controller.isTileSelected(item),
              onTap: () async {
                await controller.onTileTap(item);
              },
              onLongPress: () {
                controller.onTileLongPress(item);
              },
            ),
          );
        },
      ),
    );
  }
}
