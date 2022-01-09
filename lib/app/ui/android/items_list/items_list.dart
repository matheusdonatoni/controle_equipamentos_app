import 'package:controle_equipamentos/app/controllers/items_list_controller/items_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/add_new_item_floating_action_button.dart';
import 'widgets/empty_items_list.dart';
import 'widgets/filled_items_list.dart';
import 'widgets/items_list_app_bar.dart';

class ItemsListPage extends GetView<ItemsListController> {
  const ItemsListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: Scaffold(
        appBar: ItemsListAppBar(),
        floatingActionButton: AddNewItemFloatingActionButton(),
        body: SafeArea(
          child: controller.obx(
            (state) => FilledItemsList(),
            onEmpty: EmptyItemsList(),
          ),
        ),
      ),
    );
  }
}
