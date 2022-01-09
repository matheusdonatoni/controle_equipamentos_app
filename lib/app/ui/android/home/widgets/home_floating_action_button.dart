import 'package:controle_equipamentos/app/controllers/home_controllers/home_controller.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/role_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_catalog_button.dart';
import 'add_machine_button.dart';

import '../../../../data/models/helpers/implementations/controllers/state_mixin_extension.dart';

class HomeFloatingActionButton extends GetView<HomeController> {
  const HomeFloatingActionButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoleBuilder(
      adminBuilder: () => controller.simpleObx(
        (state) => AddMachineButton(),
        onEmpty: AddCatalogButton(),
      ),
    );
  }
}
