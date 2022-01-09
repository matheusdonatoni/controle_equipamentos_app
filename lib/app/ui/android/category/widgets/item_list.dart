import 'package:controle_equipamentos/app/controllers/category_controllers/items_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/tiles/item_tile.dart';

class ItemList extends GetView<ItemsTabController> {
  ItemList(
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
          var item = state[index];

          return Obx(
            () => ItemTile(
              key: ObjectKey(item),
              selected: controller.isTileSelected(item),
              item: item,
              onTap: () async {
                await controller.onTileTap(item);
              },
              onLongPress: () async {
                controller.onTileLongPress(item);
              },
            ),
          );
        },
      ),
    );
  }
}
