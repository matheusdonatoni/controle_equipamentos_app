import 'package:controle_equipamentos/app/controllers/category_controllers/impl/category_controller_impl.dart';
import 'package:controle_equipamentos/app/data/models/category.dart';
import 'package:controle_equipamentos/app/data/models/helpers/category_arguments.dart';
import 'package:controle_equipamentos/app/data/models/helpers/enums.dart';
import 'package:controle_equipamentos/app/routes/routes.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/dialogs/confirm_delete_dialog.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/snackbars/contextual_snackbar.dart';
import 'package:get/get.dart';

class CategoryController extends CategoryControllerImpl {
  CategoryController(Category reference, Category parent)
      : super(reference, parent);

  Future<void> pushManageCategoryPage(
    Category category,
    Category parent,
  ) async {
    await Get.toNamed(
      Routes.MANAGE_CATEGORY,
      arguments: CategoryArguments(
        category,
        parent: parent,
      ),
    );
  }

  Future<void> onActionSelected(ObjectAction pageAction) async {
    switch (pageAction) {
      case ObjectAction.edit:
        {
          await updateCategory();
          break;
        }
      case ObjectAction.delete:
        {
          await showDeleteCategoryDialog();
          break;
        }
      default:
        {
          break;
        }
    }
  }

  Future<void> updateCategory() async {
    await pushManageCategoryPage(category, parent);
  }

  Future<void> showDeleteCategoryDialog() async {
    await Get.dialog(
      ConfirmExclusionDialog(
        category.name,
        onConfirmDeletePressed: () async => await deleteCategory(),
      ),
    );
  }

  Future<void> deleteCategory() async {
    await categoryRepository.delete(category).then(
      (val) {
        categories.removeWhere((e) => e.id == category.id);

        Get.close(2);
      },
      onError: ContextualSnackbar.error,
    );
  }
}
