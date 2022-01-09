import 'package:controle_equipamentos/app/data/models/catalog.dart';
import 'package:controle_equipamentos/app/data/models/unit.dart';
import 'package:controle_equipamentos/app/data/models/user.dart';
import 'package:controle_equipamentos/app/data/repositories/catalog_repository.dart';
import 'package:controle_equipamentos/app/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ManageCatalogControllerImpl extends GetxController with StateMixin<Catalog> {
  ManageCatalogControllerImpl(this.reference);

  final formKey = GlobalKey<FormState>();

  final Catalog reference;

  CatalogRepository get catalogRepository => Get.find();

  AuthServices get _authServices => Get.find();

  User get _user => _authServices.user;

  Unit get unit => _user.unit;

  set catalog(Catalog newValue) => _user.catalog = newValue;

  bool get isNew => reference.isNew;
}
