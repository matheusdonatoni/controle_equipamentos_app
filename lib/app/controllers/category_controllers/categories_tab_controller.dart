import 'package:controle_equipamentos/app/controllers/category_controllers/impl/categories_tab_controller_impl.dart';
import 'package:controle_equipamentos/app/data/models/category.dart';
import 'package:controle_equipamentos/app/data/models/helpers/category_arguments.dart';
import 'package:controle_equipamentos/app/routes/routes.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/dialogs/confirm_delete_dialog.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/snackbars/contextual_snackbar.dart';
import 'package:get/get.dart';

import '../../data/models/helpers/implementations/controllers/state_mixin_extension.dart';


class CategoriesTabController extends CategoriesTabControllerImpl {
  CategoriesTabController(Category parent) : super(parent);

  Future<void> createCategory() async {
    await pushManageCategoryPage(Category(), parent);
  }

  Future<void> pushCategory(Category category) async {
    await Get.toNamed(
      Routes.CATEGORY.replaceAll(r':id', category.id.toString()),
      preventDuplicates: false,
      arguments: CategoryArguments(
        category,
        parent: parent,
      ),
    );
  }

  Future<void> updateCategory() async {
    await pushManageCategoryPage(selectedTiles.single, parent);
  }

  Future<void> showDeleteCategoriesDialog() async {
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

    await categoryRepository
        .findAllFrom(category: parent)
        .then(categories.assignAll, onError: ContextualSnackbar.error);
  }

  Future<void> pushManageCategoryPage(
      Category category, Category parent) async {
    await Get.toNamed(
      Routes.MANAGE_CATEGORY,
      arguments: CategoryArguments(
        category,
        parent: parent,
      ),
    );
  }

  @override
  void onInit() async {
    super.onInit();

    addTabListener();
  }

  @override
  void onReady() async {
    super.onReady();

    await findCategories();
  }

  @override
  Future<void> onTileTap(Category category) async {
    if (isNotAtEditMode) {
      await pushCategory(category);
    } else {
      onEditModeCallback(category);
    }
  }
}
