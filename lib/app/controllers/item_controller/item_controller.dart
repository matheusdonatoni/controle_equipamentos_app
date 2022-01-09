import 'package:controle_equipamentos/app/data/models/category.dart';
import 'package:controle_equipamentos/app/data/models/item.dart';
import 'package:controle_equipamentos/app/data/models/helpers/enums.dart';
import 'package:controle_equipamentos/app/routes/routes.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/dialogs/confirm_delete_dialog.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/snackbars/contextual_snackbar.dart';
import 'package:get/get.dart';

import '../../data/models/helpers/implementations/controllers/state_mixin_extension.dart';

import 'impl/item_controller_impl.dart';

class ItemController extends ItemControllerImpl {
  ItemController(
    Item reference,
    Category parent,
  ) : super(
          parent,
          reference,
        );

  Future<void> onActionSelected(ObjectAction pageAction) async {
    switch (pageAction) {
      case ObjectAction.edit:
        {
          await updateItem();
          break;
        }
      case ObjectAction.delete:
        {
          await showDeleteItemDialog();
          break;
        }
      default:
        {
          break;
        }
    }
  }

  Future<void> pushManageItemPage() async {
    await Get.toNamed(
      Routes.MANAGE_ITEM,
      arguments: item,
    );
  }

  Future<void> updateItem() async {
    await pushManageItemPage();
  }

  Future<void> showDeleteItemDialog() async {
    await Get.dialog(
      ConfirmExclusionDialog(
        item.name,
        shouldShowRemove: hasParent,
        onConfirmDeletePressed: () async =>
            hasParent ? await removeItem() : await deleteItem(),
      ),
    );
  }

  Future<void> removeItem() async {
    await itemRepository.removeFromCategory(item, parent).then(
      (val) {
        items.removeWhere((e) => e.id == item.id);

        Get.close(2);
      },
      onError: ContextualSnackbar.error,
    );
  }

  Future<void> deleteItem() async {
    await itemRepository.delete(item).then(
      (val) {
        items.removeWhere((e) => e.id == item.id);

        Get.close(2);
      },
      onError: ContextualSnackbar.error,
    );
  }
}
