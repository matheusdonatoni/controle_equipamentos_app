import 'dart:io';
import 'package:controle_equipamentos/app/data/models/helpers/item_arguments.dart';
import 'package:controle_equipamentos/app/data/models/item.dart';
import 'package:controle_equipamentos/app/data/models/picture.dart';
import 'package:controle_equipamentos/app/routes/routes.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/snackbars/contextual_snackbar.dart';
import 'package:get/get.dart';

import '../../data/models/helpers/implementations/controllers/state_mixin_extension.dart';
import 'impl/manage_item_controller_impl.dart';

class ManageItemController extends ManageItemControllerImpl {
  ManageItemController(Item reference) : super(reference);

  String nameError;
  String descriptionError;
  String measurementError;
  String codeError;

  Future<void> validateName() async {
    if (value.name == null || value.name.isEmpty) {
      nameError = 'Digite um nome';
    } else if (await isNameNotValid) {
      nameError = 'Nome já cadastrado';
    } else {
      nameError = null;
    }
  }

  void validateDescription() {
    if (value.description == null || value.description.isEmpty) {
      descriptionError = 'Digite uma descrição';
    } else {
      descriptionError = null;
    }
  }

  void validateMeasurement() {
    if (value.measurement == null) {
      measurementError = 'Escolha uma unidade de medida';
    } else {
      measurementError = null;
    }
  }

  Future<void> validateCode() async {
    if (value.code == null || value.code.isEmpty) {
      codeError = 'Digite um código válido';
    } else if (await isCodeNotValid) {
      codeError = 'Código já cadastrado';
    } else {
      codeError = null;
    }
  }

  void onPictureChanged(Picture picture) {
    value.picture = picture;
  }
  
  Future<void> itemValidator() async {
    await validateName();
    validateDescription();
    validateMeasurement();
    await validateCode();

    changeToLoadingMore();

    if (formKey.currentState.validate()) {
      if (isOld) {
        await updateItem();
      } else {
        await createItem();
      }
    }

    changeToSuccess();
  }

  Future<void> createItem() async {
    await itemRepository.create(value).then(
      (val) {
        items.add(val);

        Get.offNamedUntil(
          Routes.ITEM,
          (route) => route.settings.name == Routes.ITEMS_LIST,
          arguments: ItemArguments(val),
        );
      },
      onError: ContextualSnackbar.error,
    );
  }

  Future<void> updateItem() async {
    await itemRepository.update(value).then(
      (val) {
        item = val;

        Get.back();
      },
      onError: ContextualSnackbar.error,
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
