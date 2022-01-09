import 'package:controle_equipamentos/app/data/repositories/theme_mode_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeServices extends GetxService {
  ThemeModeRepository get _themeModeRepository => Get.find();

  final themeMode = Rxn<ThemeMode>();

  @override
  void onInit() {
    super.onInit();

    themeMode(_themeModeRepository.findThemeMode());

    saveThemeMode();
  }

  void saveThemeMode() {
    ever(
      themeMode,
      (mode) async {
        await _themeModeRepository.saveThemeMode(
          mode,
        );

        Get.changeThemeMode(mode);
      },
    );
  }

  String get themeModeToString {
    if (themeMode() == null || themeMode() == ThemeMode.system) {
      return 'Sistema';
    } else if (themeMode() == ThemeMode.light) {
      return 'Claro';
    } else {
      return 'Escuro';
    }
  }
}
