import 'package:controle_equipamentos/app/controllers/settings_controllers/catalog_settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/helpers/implementations/controllers/state_mixin_extension.dart';

class CatalogTile extends GetView<CatalogSettingsController> {
  const CatalogTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.simpleObx(
      (state) => ListTile(
        leading: Icon(
          Icons.subtitles_rounded,
        ),
        title: Text('Catálogo'),
        subtitle: Text(state.name),
        onTap: () async => await controller.updateCatalog(),
        onLongPress: () async => await controller.showCatalogOptions(),
        trailing: Icon(Icons.keyboard_arrow_right_rounded),
      ),
      onEmpty: ListTile(
        leading: Icon(
          Icons.subtitles_off,
        ),
        title: Text('Catálogo'),
        subtitle: Text('Sua unidade ainda não possui um catálogo'),
        onTap: () async => await controller.createCatalog(),
        trailing: Icon(Icons.keyboard_arrow_right_rounded),
      ),
    );
  }
}
