import 'package:controle_equipamentos/app/controllers/home_controllers/machine_list_controller.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/role_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMachineButton extends GetView<MachineListController> {
  AddMachineButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoleBuilder(
      adminBuilder: () => FloatingActionButton.extended(
        label: Text('Equipamento'),
        icon: Icon(Icons.add),
        onPressed: () async {
          await controller.createMachine();
        },
      ),
    );
  }
}
