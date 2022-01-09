import 'package:controle_equipamentos/app/controllers/home_controllers/machine_list_controller.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/controllers/getx_controller_impl.dart';
import 'package:controle_equipamentos/app/data/models/machine.dart';
import 'package:controle_equipamentos/app/data/repositories/machine_repository.dart';
import 'package:get/get.dart';

abstract class MachineControllerImpl extends GetxControllerImpl<Machine> {
  MachineControllerImpl(this.reference);

  final Machine reference;

  MachineRepository get machineRepository => Get.find();

  MachineListController get _machineListController => Get.find();

  RxList<Machine> get machines => _machineListController.machines;

  int get _index => machines.indexWhere(
        (e) => e.id == reference?.id,
      );

  Machine get machine => _index == -1 ? null : machines[_index];

  @override
  get initial => machine;

  @override
  get stream => machines.stream.map((machines) => machine);
}
