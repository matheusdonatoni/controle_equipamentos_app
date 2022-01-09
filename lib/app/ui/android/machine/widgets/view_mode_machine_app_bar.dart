import 'package:controle_equipamentos/app/controllers/machine_controllers/machine_controller.dart';
import 'package:controle_equipamentos/app/data/models/helpers/enums.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/popup_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/helpers/implementations/controllers/state_mixin_extension.dart';

class ViewModeMachineAppBar extends GetView<MachineController> {
  const ViewModeMachineAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: controller.simpleObx(
        (state) => Text(state.name),
        onEmpty: Text('Equipamento'),
      ),
      actions: [
        controller.simpleObx(
          (state) => PopupActionButton(
            extraOptions: [
              PopupMenuItem<ObjectAction>(
                value: ObjectAction.duplicate,
                child: Text('Duplicar'),
              ),
            ],
            onSelected: (value) => controller.onActionSelected(
              value,
            ),
          ),
        ),
      ],
    );
  }
}
