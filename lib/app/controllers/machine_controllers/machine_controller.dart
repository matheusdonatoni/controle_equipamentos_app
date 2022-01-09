import 'package:controle_equipamentos/app/controllers/machine_controllers/impl/machine_controller_impl.dart';
import 'package:controle_equipamentos/app/data/models/machine.dart';
import 'package:controle_equipamentos/app/data/models/helpers/enums.dart';
import 'package:controle_equipamentos/app/routes/routes.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/dialogs/confirm_delete_dialog.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/snackbars/contextual_snackbar.dart';
import 'package:get/get.dart';


class MachineController extends MachineControllerImpl {
  MachineController(Machine reference) : super(reference);

  Future<void> onActionSelected(ObjectAction pageAction) async {
    switch (pageAction) {
      case ObjectAction.duplicate:
        {
          await duplicateMachine();
          break;
        }
      case ObjectAction.edit:
        {
          await updateMachine();
          break;
        }
      case ObjectAction.delete:
        {
          await showDeleteMachineDialog();
          break;
        }
      default:
        {
          break;
        }
    }
  }

  Future<void> pushManageMachinePage(Machine machine) async {
    await Get.toNamed(
      Routes.MANAGE_MACHINE,
      arguments: machine,
    );
  }

  Future<void> updateMachine() async {
    await pushManageMachinePage(machine);
  }

  Future<void> duplicateMachine() async {
    await pushManageMachinePage(
      machine.forDuplication(),
    );
  }

  Future<void> showDeleteMachineDialog() async {
    await Get.dialog(
      ConfirmExclusionDialog(
        machine.name,
        onConfirmDeletePressed: () async => await deleteMachine(),
      ),
    );
  }

  Future<void> deleteMachine() async {
    await machineRepository.delete(machine).then(
      (val) {
        machines.removeWhere((e) => e.id == reference.id);

        Get.until(
          (route) => route.settings.name == Routes.HOME,
        );
      },
      onError: ContextualSnackbar.error,
    );
  }
}
