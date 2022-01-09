import 'package:controle_equipamentos/app/controllers/machine_controllers/machine_controller.dart';
import 'package:controle_equipamentos/app/ui/android/machine/widgets/machine_category_list.dart';
import 'package:controle_equipamentos/app/ui/android/machine/widgets/machine_specifications_list.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/framed_picture.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilledMachine extends GetView<MachineController> {
  const FilledMachine({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var machine = controller.state;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24.0,
          ),
          FramedPicture(
            machine.picture,
            tag: machine.runtimeType.toString() + machine.id.toString(),
          ),
          SizedBox(
            height: 24.0,
          ),
          MachineSpacificationsList(),
          MachineCategoryList(),
          SizedBox(
            height: 72.0,
          )
        ],
      ),
    );
  }
}
