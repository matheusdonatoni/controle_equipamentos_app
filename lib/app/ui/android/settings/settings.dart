import 'package:controle_equipamentos/app/controllers/settings_controllers/settings_controller.dart';
import 'package:controle_equipamentos/app/services/theme_services.dart';
import 'package:controle_equipamentos/app/ui/android/settings/widgets/catalog_tile.dart';
import 'package:controle_equipamentos/app/ui/android/settings/widgets/theme_mode_dialog.dart';
import 'package:controle_equipamentos/app/ui/android/settings/widgets/unit_tile.dart';
import 'package:controle_equipamentos/app/ui/android/settings/widgets/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  UserTile(),
                  UnitTile(),
                  CatalogTile(),
                  ListTile(
                    leading: Icon(
                      Icons.brightness_medium,
                    ),
                    title: Text('Tema'),
                    subtitle: Text(
                      Get.find<ThemeServices>().themeModeToString,
                    ),
                    onTap: () async => await controller.showThemeDialog(
                      context,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
