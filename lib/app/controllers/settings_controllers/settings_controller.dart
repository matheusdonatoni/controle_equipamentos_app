import 'package:controle_equipamentos/app/controllers/settings_controllers/impl/settings_controller_impl.dart';
import 'package:controle_equipamentos/app/ui/android/settings/widgets/theme_mode_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsController extends SettingsControllerImpl {
  Future<void> showThemeDialog(BuildContext context) async => await showDialog(
        context: context,
        builder: (context) => ThemeModeDialog(),
      );
}
