import 'package:controle_equipamentos/app/controllers/home_controllers/machine_list_controller.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/animations/animated_app_bar_switcher.dart/animated_app_bar_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'edit_mode_home_app_bar.dart';
import 'view_mode_home_app_bar.dart';

class AnimatedHomeAppBar extends GetView<MachineListController>
    with PreferredSizeWidget {
  const AnimatedHomeAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedAppBarSwitcher(
        firstAppBar: ViewModeHomeAppBar(),
        secondAppBar: EditModeHomeAppBar(),
        showFirst: controller.isNotAtEditMode,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
