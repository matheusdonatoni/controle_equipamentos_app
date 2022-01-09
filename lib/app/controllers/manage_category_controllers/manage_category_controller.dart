import 'package:controle_equipamentos/app/data/models/category.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/snackbars/contextual_snackbar.dart';
import 'package:get/get.dart';

import '../../data/models/helpers/implementations/controllers/state_mixin_extension.dart';
import 'impl/manage_category_controller_impl.dart';

class ManageCategoryController extends ManageCategoryControllerImpl {
  ManageCategoryController(Category reference, Category parent)
      : super(reference, parent);

  String nameError;

  Future<void> validateName() async {
    if (value.name == null || value.name.isEmpty) {
      nameError = 'Defina um nome';
    } else if (isNotInitialName) {
      if (await isNameNotUnique) {
        nameError = 'Esta categoria já existe';
      } else {
        nameError = null;
      }
    } else {
      nameError = null;
    }
  }

  Future<void> categoryCreateValidator() async {
    await validateName();

    changeToLoadingMore();

    if (formKey.currentState.validate()) {
      if (isNew) {
        await createCategory();
      } else {
        await updateCategory();
      }
    }

    changeToSuccess();
  }

  Future<void> updateCategory() async {
    await categoryRepository.update(value).then(
      (val) {
        category = val;

        Get.back();
      },
      onError: ContextualSnackbar.error,
    );
  }

  Future<void> createCategory() async {
    await categoryRepository
        .create(value, machine: machine, parent: parent)
        .then(
      (val) {
        categories.add(val);

        Get.back();
      },
      onError: ContextualSnackbar.error,
    );
  }

  @override
  void onInit() {
    super.onInit();

    change(
      reference.copyWith(),
      status: RxStatus.success(),
    );
  }
}
