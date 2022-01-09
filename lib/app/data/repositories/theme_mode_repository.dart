import 'package:controle_equipamentos/app/data/models/helpers/implementations/repositories/repository_impl.dart';
import 'package:flutter/material.dart';

class ThemeModeRepository extends RepositoryImpl {
  ThemeMode findThemeMode() => localStorage.findThemeMode();

  Future<void> saveThemeMode(ThemeMode themeMode) => localStorage.saveThemeMode(
        themeMode,
      );
}
