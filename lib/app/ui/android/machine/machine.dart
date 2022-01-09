import 'package:controle_equipamentos/app/controllers/machine_controllers/machine_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/helpers/implementations/controllers/state_mixin_extension.dart';
import 'widgets/filled_machine.dart';
import 'widgets/machine_app_bar.dart';
import 'widgets/add_category_button.dart';
import 'widgets/empty_machine.dart';

class MachinePage extends GetView<MachineController> {
  const MachinePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MachineAppBar(),
      floatingActionButton: controller.simpleObx(
        (state) => AddCategoryButtom(),
      ),
      body: controller.obx(
        (_) => FilledMachine(),
        onEmpty: EmptyMachine(),
      ),
    );
  }
}
