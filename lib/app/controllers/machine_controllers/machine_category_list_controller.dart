import 'package:controle_equipamentos/app/data/models/category.dart';
import 'package:controle_equipamentos/app/data/models/helpers/category_arguments.dart';
import 'package:controle_equipamentos/app/routes/routes.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/dialogs/confirm_delete_dialog.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/snackbars/contextual_snackbar.dart';
import 'package:get/get.dart';

import 'impl/machine_category_list_controller_impl.dart';

import '../../data/models/helpers/implementations/controllers/state_mixin_extension.dart';

class MachineCategoryListController extends MachineCategoryListControllerImpl {
  @override
  Future<void> onTileTap(Category category) async {
    if (isNotAtEditMode) {
      await pushCategory(category);
    } else {
      onEditModeCallback(category);
    }
  }

  Future<void> pushCategory(Category category) async {
    await Get.toNamed(
      Routes.CATEGORY.replaceAll(r':id', category.id.toString()),
      arguments: CategoryArguments(
        category,
      ),
    );
  }

  Future<void> pushManageCategoryPage(Category category) async {
    if (isAtEditMode) toggleEditMode();

    await Get.toNamed(
      Routes.MANAGE_CATEGORY,
      arguments: CategoryArguments(
        category,
      ),
    );
  }

  Future<void> updateCategory() async {
    await pushManageCategoryPage(selectedTiles.single);
  }

  Future<void> createCategory() async {
    await pushManageCategoryPage(Category());
  }

  Future<void> showDeleteCategoryDialog() async {
    await Get.dialog(
      ConfirmExclusionDialog(
        isSingleTileSelected
            ? selectedTiles.single.name
            : '${selectedTiles.length} seções',
        onConfirmDeletePressed: () async => await deleteCategories(),
      ),
    );
  }

  Future<void> deleteCategories() async {
    for (var category in selectedTiles) {
      await categoryRepository.delete(category).then(
            (val) => categories.removeWhere((e) => e.id == category.id),
            onError: ContextualSnackbar.error,
          );
    }

    toggleEditMode();

    Get.back();
  }

  Future<void> findCategories() async {
    changeToLoading();

    await categoryRepository.findAllFrom(machine: machine).then(
          categories.assignAll,
          onError: ContextualSnackbar.error,
        );
  }

  void sort() => categories.sort((a, b) => a.name.compareTo(b.name));

  @override
  void onReady() async {
    super.onReady();

    await findCategories();
  }
}
