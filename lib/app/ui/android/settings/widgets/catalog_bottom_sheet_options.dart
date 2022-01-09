import 'package:controle_equipamentos/app/controllers/settings_controllers/catalog_settings_controller.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/bottom_sheet_options/bottom_sheet_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatalogBottomSheetOptions extends GetView<CatalogSettingsController> {
  const CatalogBottomSheetOptions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheetOptions(
      message: controller.state.name,
    );
  }
}
