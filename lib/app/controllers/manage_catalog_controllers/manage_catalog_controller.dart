import 'package:controle_equipamentos/app/data/models/catalog.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/snackbars/contextual_snackbar.dart';
import 'package:get/get.dart';

import '../../data/models/helpers/implementations/controllers/state_mixin_extension.dart';
import 'impl/manage_catalog_controller_impl.dart';

class ManageCatalogController extends ManageCatalogControllerImpl {
  ManageCatalogController(Catalog referece) : super(referece);

  String nameError;

  Future<void> nameValidator() async {
    if (value.name == null || value.name.isEmpty) {
      nameError = 'Defina um nome';
    } else {
      nameError = null;
    }
  }

  Future<void> createCatalogValidator() async {
    await nameValidator();

    changeToLoadingMore();

    if (formKey.currentState.validate()) {
      if (isNew) {
        await createCatalog();
      } else {
        await updateCatalog();
      }
    }

    changeToSuccess();
  }

  Future<void> createCatalog() async {
    await catalogRepository.create(value, unit).then(
          assingValueAndPop,
          onError: ContextualSnackbar.error,
        );
  }

  Future<void> updateCatalog() async {
    await catalogRepository.update(value).then(
          assingValueAndPop,
          onError: ContextualSnackbar.error,
        );
  }

  void assingValueAndPop(Catalog newValue) {
    catalog = newValue;

    Get.back();
  }

  @override
  void onReady() {
    super.onReady();

    change(
      reference.copyWith(),
      status: RxStatus.success(),
    );
  }
}
