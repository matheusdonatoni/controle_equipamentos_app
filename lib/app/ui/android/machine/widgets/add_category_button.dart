import 'package:controle_equipamentos/app/controllers/machine_controllers/machine_category_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCategoryButtom extends GetView<MachineCategoryListController> {
  const AddCategoryButtom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: Text('Seção'),
      icon: Icon(Icons.add),
      onPressed: () async {
        await controller.createCategory();
      },
    );
  }
}
