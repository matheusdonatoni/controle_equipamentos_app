import 'package:controle_equipamentos/app/controllers/category_controllers/items_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemFloatingActionButton extends GetView<ItemsTabController> {
  const ItemFloatingActionButton(
    this.tag, {
    Key key,
  }) : super(key: key);

  final String tag;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () async {
        await controller.pushItemsList();
      },
      icon: Icon(Icons.add),
      label: Text(
        'Peça(s)',
      ),
    );
  }
}
