import 'package:controle_equipamentos/app/controllers/machine_controllers/machine_category_list_controller.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/animations/animated_app_bar_switcher.dart/animated_app_bar_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'edit_mode_machine_app_bar.dart';
import 'view_mode_machine_app_bar.dart';

class AnimatedMachineAppBar extends GetView<MachineCategoryListController> {
  const AnimatedMachineAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedAppBarSwitcher(
        firstAppBar: ViewModeMachineAppBar(),
        secondAppBar: EditModeMachineAppBar(),
        showFirst: controller.isNotAtEditMode,
      ),
    );
  }
}
