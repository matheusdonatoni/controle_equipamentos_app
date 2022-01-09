import 'package:controle_equipamentos/app/controllers/home_controllers/home_controller.dart';
import 'package:controle_equipamentos/app/data/models/catalog.dart';
import 'package:controle_equipamentos/app/data/models/machine.dart';
import 'package:controle_equipamentos/app/data/repositories/machine_repository.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/snackbars/contextual_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageMachineControllerImpl extends GetxController
    with StateMixin<Machine> {
  ManageMachineControllerImpl(this.reference);

  final formKey = GlobalKey<FormState>();

  final Machine reference;

  MachineRepository get machineRepository => Get.find();

  HomeController get homeController => Get.find();

  Catalog get catalog => homeController.catalog;

  RxList<Machine> get machines => catalog.machines;

  int get _index => machines.indexWhere((e) => e.id == reference.id);

  set machine(Machine newValue) => machines[_index] = newValue;

  bool get isNew => reference.id == null;
  bool get isOld => !isNew;

  bool get isRefName => reference.name == value.name && isOld;
  bool get isRefCode => reference.code == value.code && isOld;

  Future<bool> get isNameUnique async {
    return machineRepository.isNameUnique(value, catalog).then(
      (value) => value,
      onError: (error) {
        ContextualSnackbar.error(error);

        return false;
      },
    );
  }

  Future<bool> get isNameValid async => await isNameUnique || isRefName;
  Future<bool> get isNameNotValid async => !await isNameValid;

  Future<bool> get isCodeUnique async {
    return machineRepository.isCodeUnique(value, catalog).then(
      (value) => value,
      onError: (error) {
        ContextualSnackbar.error(error);

        return false;
      },
    );
  }

  Future<bool> get isCodeValid async => await isCodeUnique || isRefCode;
  Future<bool> get isCodeNotValid async => !await isCodeValid;
}
