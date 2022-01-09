import 'package:controle_equipamentos/app/controllers/home_controllers/machine_list_controller.dart';
import 'package:controle_equipamentos/app/ui/android/home/widgets/empty_machine_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'machine_tile.dart';

class MachineList extends GetView<MachineListController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => WillPopScope(
        onWillPop: controller.onWillPop,
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: state.length,
          itemBuilder: (context, index) {
            var machine = state[index];

            return Obx(
              () => MachineTile(
                key: ObjectKey(machine),
                onTap: () async => await controller.onTileTap(machine),
                onLongPress: () => controller.onTileLongPress(machine),
                machine: machine,
                selected: controller.isTileSelected(machine),
              ),
            );
          },
        ),
      ),
      onEmpty: EmptyMachineList(),
    );
  }
}
