import 'package:controle_equipamentos/app/controllers/settings_controllers/unit_settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnitTile extends GetView<UnitSettingsController> {
  const UnitTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.push_pin),
      title: Text('Unidade'),
      subtitle: Text(
        '${controller.state.code} - ${controller.state.name}',
      ),
    );
  }
}
