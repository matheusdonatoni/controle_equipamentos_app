import 'package:controle_equipamentos/app/controllers/settings_controllers/impl/catalog_settings_controller_impl.dart';
import 'package:controle_equipamentos/app/data/models/catalog.dart';
import 'package:controle_equipamentos/app/data/models/helpers/enums.dart';
import 'package:controle_equipamentos/app/routes/routes.dart';
import 'package:controle_equipamentos/app/ui/android/settings/widgets/catalog_bottom_sheet_options.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/dialogs/confirm_delete_dialog.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/snackbars/contextual_snackbar.dart';
import 'package:get/get.dart';

import '../../data/models/helpers/implementations/controllers/state_mixin_extension.dart';

class CatalogSettingsController extends CatalogSettingsControllerImpl {
  Future<void> pushManageCatalogPage(Catalog catalog) async {
    await Get.toNamed(
      Routes.MANAGE_CATALOG,
      arguments: catalog,
    );
  }

  Future<void> createCatalog() async {
    await pushManageCatalogPage(Catalog());
  }

  Future<void> updateCatalog() async {
    await pushManageCatalogPage(value);
  }

  Future<void> showCatalogOptions() async {
    var result = await Get.bottomSheet<ObjectAction>(
      CatalogBottomSheetOptions(),
    );

    if (result == ObjectAction.edit) {
      updateCatalog();
    } else if (result == ObjectAction.delete) {
      showDeleteCatalogDialog();
    }
  }

  Future<void> showDeleteCatalogDialog() async {
    await Get.dialog(
      ConfirmExclusionDialog(
        value.name,
        onConfirmDeletePressed: () async => await deleteCatalog(),
      ),
    );
  }

  Future<void> deleteCatalog() async {
    await catalogRepository.delete(value).then(
      (val) {
        catalog = null;

        Get.back();
      },
      onError: ContextualSnackbar.error,
    );
  }
}
