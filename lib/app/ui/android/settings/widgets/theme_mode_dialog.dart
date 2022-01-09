import 'package:controle_equipamentos/app/services/theme_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeModeDialog extends GetView<ThemeServices> {
  const ThemeModeDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Get.theme.cardColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text('Tema'),
            subtitle: Text('Comportamento do tema'),
          ),
          Obx(
            () => RadioListTile<ThemeMode>(
              controlAffinity: ListTileControlAffinity.trailing,
              title: Text('Claro'),
              value: ThemeMode.light,
              groupValue: controller.themeMode(),
              onChanged: controller.themeMode,
            ),
          ),
          Obx(
            () => RadioListTile<ThemeMode>(
              controlAffinity: ListTileControlAffinity.trailing,
              title: Text('Escuro'),
              value: ThemeMode.dark,
              groupValue: controller.themeMode(),
              onChanged: controller.themeMode,
            ),
          ),
          Obx(
            () => RadioListTile<ThemeMode>(
              controlAffinity: ListTileControlAffinity.trailing,
              title: Text('Sistema'),
              value: ThemeMode.system,
              groupValue: controller.themeMode(),
              onChanged: controller.themeMode,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextButton(
              onPressed: Get.back,
              child: Text('Pronto'),
            ),
          )
        ],
      ),
    );
  }
}
