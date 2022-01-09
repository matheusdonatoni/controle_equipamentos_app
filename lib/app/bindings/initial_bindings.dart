import 'package:controle_equipamentos/app/data/repositories/theme_mode_repository.dart';
import 'package:controle_equipamentos/app/services/auth_services.dart';
import 'package:controle_equipamentos/app/data/providers/api.dart';
import 'package:controle_equipamentos/app/data/repositories/auth_respository.dart';
import 'package:controle_equipamentos/app/services/theme_services.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    providersDependencies();

    repositoriesDependencies();

    servicesDependencies();
  }

  void providersDependencies() {
    Get.put(Api(), permanent: true);
  }

  void repositoriesDependencies() {
    Get.lazyPut(() => AuthRepository(), fenix: true);
    Get.lazyPut(() => ThemeModeRepository(), fenix: true);
  }

  void servicesDependencies() {
    Get.put(AuthServices(), permanent: true);
    Get.put(ThemeServices(), permanent: true);
  }
}
