import 'package:controle_equipamentos/app/controllers/machine_controllers/machine_controller.dart';
import 'package:controle_equipamentos/app/ui/android/machine/widgets/animated_machine_app_bar.dart';
import 'package:controle_equipamentos/app/ui/android/machine/widgets/view_mode_machine_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/helpers/implementations/controllers/state_mixin_extension.dart';

class MachineAppBar extends GetView<MachineController>
    implements PreferredSizeWidget {
  const MachineAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.simpleObx(
      (state) => AnimatedMachineAppBar(),
      onEmpty: ViewModeMachineAppBar(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
