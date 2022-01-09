import 'package:controle_equipamentos/app/controllers/category_controllers/items_tab_controller.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/tab_counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemTab extends GetView<ItemsTabController> {
  const ItemTab(
    this.tag, {
    Key key,
  }) : super(key: key);

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Peças'),
          SizedBox(
            width: 6.0,
          ),
          Obx(() => TabCounter(controller.count)),
        ],
      ),
    );
  }
}
