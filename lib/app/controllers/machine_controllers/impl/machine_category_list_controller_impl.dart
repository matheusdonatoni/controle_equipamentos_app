import 'package:controle_equipamentos/app/controllers/machine_controllers/machine_controller.dart';
import 'package:controle_equipamentos/app/data/models/category.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/controllers/getx_controller_impl.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/controllers/selectable_rx_list.dart';
import 'package:controle_equipamentos/app/data/models/machine.dart';
import 'package:controle_equipamentos/app/data/repositories/category_repository.dart';
import 'package:get/get.dart';

abstract class MachineCategoryListControllerImpl
    extends GetxControllerImpl<List<Category>> with SelectableRxList<Category> {
  CategoryRepository get categoryRepository => Get.find();

  MachineController get _machineController => Get.find();

  Machine get machine => _machineController.machine;

  RxList<Category> get categories => machine.rx.categories;

  @override
  get initial => categories;

  @override
  get stream => categories.stream;
}
