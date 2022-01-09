import 'package:controle_equipamentos/app/controllers/items_list_controller/items_list_controller.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/search_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/helpers/implementations/controllers/state_mixin_extension.dart';

class ViewModeItemsListAppBar extends GetView<ItemsListController> {
  const ViewModeItemsListAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Lista de peças'),
      actions: [
        controller.simpleObx(
          (state) => SearchIconButton(
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
