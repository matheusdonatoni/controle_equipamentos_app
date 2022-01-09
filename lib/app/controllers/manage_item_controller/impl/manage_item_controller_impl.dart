import 'package:controle_equipamentos/app/controllers/items_list_controller/items_list_controller.dart';
import 'package:controle_equipamentos/app/data/models/item.dart';
import 'package:controle_equipamentos/app/data/repositories/item_repository.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/snackbars/contextual_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageItemControllerImpl extends GetxController with StateMixin<Item> {
  ManageItemControllerImpl(this.reference);

  ItemRepository get itemRepository => Get.find();

  ItemsListController get _itemsListController => Get.find();

  RxList<Item> get items => _itemsListController.items;

  int get _index => items.indexWhere((e) => reference.id == e.id);

  set item(Item newValue) => items[_index] = newValue;

  final formKey = GlobalKey<FormState>();

  final Item reference;

  String get initialName => reference.name;

  bool get isOld => reference.id != null;

  bool get isReferenceName => value.name == initialName && isOld;
  bool get isReferenceCode => value.code == reference.code && isOld;

  Future<bool> get isNameUnique async => await itemRepository
      .isNameUnique(value)
      .then((val) => val, onError: ContextualSnackbar.error);

  Future<bool> get isCodeUnique async => await itemRepository
      .isCodeUnique(value)
      .then((val) => val, onError: ContextualSnackbar.error);

  Future<bool> get isNameValid async => isReferenceName || await isNameUnique;
  Future<bool> get isNameNotValid async => !await isNameValid;

  Future<bool> get isCodeValid async => isReferenceCode || await isCodeUnique;
  Future<bool> get isCodeNotValid async => !await isCodeValid;
}
