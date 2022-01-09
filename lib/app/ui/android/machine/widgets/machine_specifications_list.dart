import 'package:controle_equipamentos/app/controllers/machine_controllers/machine_controller.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/specification_marker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/helpers/implementations/controllers/state_mixin_extension.dart';

class MachineSpacificationsList extends GetView<MachineController> {
  const MachineSpacificationsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.simpleObx(
      (state) => ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          SpecificationMarker(
            '''Modelo: ${state.model}''',
          ),
          const SizedBox(height: 4.0),
          SpecificationMarker(
            '''Marca: ${state.brand}''',
          ),
          const SizedBox(height: 4.0),
          SpecificationMarker(
            '''Setor: ${state.sector.name}''',
          ),
          const SizedBox(height: 4.0),
          SpecificationMarker(
            '''Código JBS: ${state.code}''',
          ),
          const SizedBox(height: 4.0),
          SpecificationMarker(
            '''TAG: ${state.tag}''',
          ),
        ],
      ),
    );
  }
}
