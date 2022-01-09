import 'package:controle_equipamentos/app/controllers/settings_controllers/catalog_settings_controller.dart';
import 'package:controle_equipamentos/app/controllers/settings_controllers/settings_controller.dart';
import 'package:controle_equipamentos/app/controllers/settings_controllers/unit_settings_controller.dart';
import 'package:controle_equipamentos/app/controllers/settings_controllers/user_settings_controller.dart';
import 'package:get/get.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsController());
    Get.lazyPut(() => UserSettingsController());
    Get.lazyPut(() => UnitSettingsController());
    Get.lazyPut(() => CatalogSettingsController());
  }
}
