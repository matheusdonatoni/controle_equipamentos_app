import 'package:controle_equipamentos/app/controllers/home_controllers/home_controller.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/controllers/getx_controller_impl.dart';
import 'package:controle_equipamentos/app/data/models/catalog.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/controllers/selectable_rx_list.dart';
import 'package:controle_equipamentos/app/data/models/machine.dart';
import 'package:controle_equipamentos/app/data/repositories/machine_repository.dart';
import 'package:get/get.dart';

abstract class MachineListControllerImpl
    extends GetxControllerImpl<List<Machine>> with SelectableRxList<Machine> {
  MachineRepository get machineRepository => Get.find();

  HomeController get _homeController => Get.find();

  Catalog get catalog => _homeController.catalog;

  RxList<Machine> get machines => catalog.rx.machines;

  @override
  get initial => machines;

  @override
  get stream => machines.stream;
}
