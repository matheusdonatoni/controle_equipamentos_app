import 'package:controle_equipamentos/app/controllers/home_controllers/impl/machine_list_controller_impl.dart';
import 'package:controle_equipamentos/app/data/models/machine.dart';
import 'package:controle_equipamentos/app/routes/routes.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/dialogs/confirm_delete_dialog.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/snackbars/contextual_snackbar.dart';
import 'package:get/get.dart';

import '../../data/models/helpers/implementations/controllers/state_mixin_extension.dart';

class MachineListController extends MachineListControllerImpl {
  // PAGINATION FUNCIONTIONS

  final tileHeight = 88.0;

  Future<int> get countAllMachines async => await machineRepository
      .count(catalog)
      .catchError(ContextualSnackbar.error);

  int get tileCountPerPage => Get.height ~/ tileHeight;

  Future<bool> get shouldFetchMoreData async =>
      machines.length < await countAllMachines;

  int get from => machines == null ? 0 : machines.length;
  int get to =>
      machines == null ? tileCountPerPage : machines.length + tileCountPerPage;

  Future<void> onLoadingPortionReached() async {
    if (await shouldFetchMoreData) {
      await findMachines();
    }
  }

  Future<void> findMachines() async {
    changeToLoading();

    await machineRepository.findAllWhere(catalog: catalog).then(
          machines.assignAll,
          onError: ContextualSnackbar.error,
        );
  }

  Future<void> createMachine() async {
    await pushManageMachinePage(Machine());
  }

  Future<void> updateMachine() async {
    await pushManageMachinePage(selectedTiles.single);
  }

  Future<void> duplicateMachine() async {
    await pushManageMachinePage(
      selectedTiles.single.forDuplication(),
    );
  }

  Future<void> pushMachinePage(Machine machine) async {
    await Get.toNamed(
      Routes.MACHINE,
      arguments: machine,
    );
  }

  Future<void> pushManageMachinePage(Machine machine) async {
    if (isAtEditMode) toggleEditMode();

    await Get.toNamed(
      Routes.MANAGE_MACHINE,
      arguments: machine,
    );
  }

  Future<void> showDeleteMachineDialog() async {
    await Get.dialog(
      ConfirmExclusionDialog(
        isSingleTileSelected
            ? selectedTiles.single.name
            : "${selectedTiles.length} equipamentos",
        onConfirmDeletePressed: () async {
          await deleteMachines();
        },
      ),
    );
  }

  Future<void> deleteMachines() async {
    for (var machine in selectedTiles) {
      await machineRepository.delete(machine).then(
            (val) => machines.removeWhere((e) => e.id == machine.id),
            onError: ContextualSnackbar.error,
          );
    }

    toggleEditMode();

    Get.back();
  }

  void sort() => machines.sort((a, b) => a.name.compareTo(b.name));

  @override
  Future<void> onTileTap(Machine machine) async {
    if (isNotAtEditMode) {
      await pushMachinePage(machine);
    } else {
      onEditModeCallback(machine);
    }
  }

  @override
  void onReady() async {
    super.onReady();

    await findMachines();
  }
}
