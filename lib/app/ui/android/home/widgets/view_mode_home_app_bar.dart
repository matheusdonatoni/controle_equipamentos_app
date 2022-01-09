import 'package:controle_equipamentos/app/controllers/home_controllers/home_controller.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/search_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/helpers/implementations/controllers/state_mixin_extension.dart';

class ViewModeHomeAppBar extends GetView<HomeController> {
  const ViewModeHomeAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: controller.simpleObx(
        (state) => Text('Catálogo'),
        onEmpty: Text('Olá, ${controller.user.firstName}'),
      ),
      actions: [
        controller.simpleObx(
          (_) => SearchIconButton(
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
