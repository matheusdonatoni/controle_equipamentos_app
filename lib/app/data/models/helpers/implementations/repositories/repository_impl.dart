import 'package:controle_equipamentos/app/data/providers/api.dart';
import 'package:controle_equipamentos/app/data/providers/local_storage.dart';
import 'package:get/get.dart';

abstract class RepositoryImpl {
  Api get api => Get.find();

  LocalStorage get localStorage => Get.find();
}
