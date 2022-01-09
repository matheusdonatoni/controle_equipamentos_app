import 'package:controle_equipamentos/app/controllers/category_controllers/items_tab_controller.dart';
import 'package:controle_equipamentos/app/ui/android/category/widgets/empty_item_list.dart';
import 'package:controle_equipamentos/app/ui/android/category/widgets/item_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemListTabView extends GetView<ItemsTabController> {
  const ItemListTabView(
    this.tag, {
    Key key,
  }) : super(key: key);

  @override
  final String tag;

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => WillPopScope(
        onWillPop: controller.onWillPop,
        child: ItemList(tag),
      ),
      onEmpty: EmptyItemList(),
    );
  }
}
