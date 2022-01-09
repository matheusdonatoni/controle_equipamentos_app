import 'package:controle_equipamentos/app/controllers/machine_controllers/machine_controller.dart';
import 'package:controle_equipamentos/app/data/models/machine.dart';
import 'package:controle_equipamentos/app/data/models/picture.dart';
import 'package:controle_equipamentos/app/routes/routes.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/snackbars/contextual_snackbar.dart';
import 'package:get/get.dart';

import 'impl/manage_machine_controller_impl.dart';

import '../../data/models/helpers/implementations/controllers/state_mixin_extension.dart';

class ManageMachineController extends ManageMachineControllerImpl {
  ManageMachineController(Machine reference) : super(reference);

  String nameError;
  String brandError;
  String modelError;
  String sectorError;
  String tagError;
  String codeError;

  Future<void> validateName() async {
    if (value.name == null || value.name.isEmpty) {
      nameError = 'Insira um nome';
    } else if (await isNameNotValid) {
      nameError = 'Este nome já está cadastrado';
    } else {
      nameError = null;
    }
  }

  void validateBrand() {
    if (value.brand == null || value.brand.isEmpty) {
      brandError = 'Insira uma marca';
    } else {
      brandError = null;
    }
  }

  void validateModel() {
    if (value.model == null || value.model.isEmpty) {
      modelError = 'Insira um modelo';
    } else {
      modelError = null;
    }
  }

  void validateSector() {
    if (value.sector == null) {
      sectorError = 'Escolha um setor';
    } else {
      sectorError = null;
    }
  }

  void validateTag() {
    if (value.tag == null || value.tag.isEmpty) {
      tagError = 'Insira um tag';
    } else {
      tagError = null;
    }
  }

  Future<void> validateCode() async {
    if (value.code == null || value.code.isEmpty) {
      codeError = 'Insira um código';
    } else if (await isCodeNotValid) {
      codeError = 'Este código já está cadastrado';
    } else {
      codeError = null;
    }
  }

  void onPictureChanged(Picture picture) {
    value.picture = picture;
  }

  Future<void> machineValidator() async {
    await validateName();
    validateBrand();
    validateModel();
    validateSector();
    validateTag();
    await validateCode();

    changeToLoadingMore();

    if (formKey.currentState.validate()) {
      if (isNew)
        await createMachine();
      else
        await updateMachine();
    }

    changeToSuccess();
  }

  Future<void> updateMachine() async {
    await machineRepository.update(value).then(
      (val) {
        machine = val;

        Get.back();
      },
      onError: ContextualSnackbar.error,
    );
  }

  Future<void> createMachine() async {
    await machineRepository.create(value, catalog).then(
      (val) async {
        machines.add(val);

        // for duplicantion proposes when called from mechine page
        if (Get.isRegistered<MachineController>()) {
          Get.delete<MachineController>();
        }

        await Get.offNamedUntil(
          Routes.MACHINE,
          (route) => route.settings.name == Routes.HOME,
          arguments: val,
        );
      },
      // onError: ContextualSnackbar.error,
    );
  }

  @override
  void onInit() {
    super.onInit();

    change(
      reference.copyWith(),
      status: RxStatus.success(),
    );
  }
}
