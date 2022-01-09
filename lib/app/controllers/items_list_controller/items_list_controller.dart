import 'package:controle_equipamentos/app/controllers/items_list_controller/impl/items_list_controller_impl.dart';
import 'package:controle_equipamentos/app/data/models/category.dart';
import 'package:controle_equipamentos/app/data/models/helpers/item_arguments.dart';
import 'package:controle_equipamentos/app/data/models/item.dart';
import 'package:controle_equipamentos/app/routes/routes.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/dialogs/confirm_delete_dialog.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/snackbars/contextual_snackbar.dart';
import 'package:get/get.dart';

import '../../data/models/helpers/implementations/controllers/state_mixin_extension.dart';

class ItemsListController extends ItemsListControllerImpl {
  ItemsListController(Category parent) : super(parent);

  //----------------------------------------------------------------------------
  //-----------------------------PAGINATION GETTERS-----------------------------
  //----------------------------------------------------------------------------

  Future<int> get countAllItems async => await itemRepository.count();

  Future<bool> get shouldFetchMoreData async =>
      items.length < await countAllItems;

  double get tileHeight => 88.0;

  int get tileCountPerPage => Get.height ~/ tileHeight;

  int get from => items == null ? 0 : items.length;
  int get to =>
      items == null ? tileCountPerPage : items.length + tileCountPerPage;

  //----------------------------------------------------------------------------
  //------------------------------GENERIC FUNCTIONS-----------------------------
  //----------------------------------------------------------------------------

  void sortList() => items.sort((a, b) => a.name.compareTo(b.name));

  bool itemBelongsToParent(Item item) {
    if (isOrphan) return false;

    return parent.items.any((e) => e.id == item.id);
  }

  Future<void> onLoadingPortionReached() async {
    if (await shouldFetchMoreData) {
      await findItemList();
    }
  }

  //----------------------------------------------------------------------------
  //---------------------------GENERIC ITEMS FUNCTIONS--------------------------
  //----------------------------------------------------------------------------

  Future<void> onAddPressed() async {
    for (var item in selectedTiles) {
      await addItemToCategory(item);
    }

    Get.back();
  }

  Future<void> findItemList() async {
    changeToLoading();

    await itemRepository.findAllWhere().then(
          items.assignAll,
          onError: ContextualSnackbar.error,
        );
  }

  Future<void> pushItemPage(Item item) async {
    await Get.toNamed(
      Routes.ITEM,
      arguments: ItemArguments(item),
    );
  }

  Future<void> addItemToCategory(Item item) async {
    await itemRepository.addToCategory(item, parent).then(
          (_) => parent.items.add(item),
          onError: ContextualSnackbar.error,
        );
  }

  Future<void> pushManageItemPage(Item item) async {
    exitEditMode();

    await Get.toNamed(
      Routes.MANAGE_ITEM,
      arguments: item,
    );
  }

  Future<void> createItem() async {
    await pushManageItemPage(Item());
  }

  Future<void> updateItem() async {
    await pushManageItemPage(selectedTiles.single);
  }

  Future<void> showExclusionItemDialog() async {
    await Get.dialog(
      ConfirmExclusionDialog(
        isSingleTileSelected
            ? selectedTiles.single.name
            : "${selectedTiles.length} peças",
        onConfirmDeletePressed: () async {
          await deleteItems();
        },
      ),
    );
  }

  Future<void> deleteItems() async {
    for (var item in selectedTiles) {
      await itemRepository.delete(item).then(
            (val) => items.removeWhere((e) => e.id == item.id),
            onError: ContextualSnackbar.error,
          );
    }

    toggleEditMode();

    Get.back();
  }

  void onAddModeCallBack(Item item) {
    if (isTileSelected(item)) {
      selectedTiles.removeWhere((e) => e.id == item.id);
    } else {
      selectedTiles.add(item);
    }
  }

  @override
  void onReady() async {
    super.onReady();

    await findItemList();

    if (hasParent) toggleEditMode();
  }

  @override
  Future<void> onTileTap(Item item) async {
    if (isNotAtEditMode) {
      await pushItemPage(item);
    } else {
      if (isOrphan) {
        onEditModeCallback(item);
      } else {
        onAddModeCallBack(item);
      }
    }
  }

  @override
  void onTileLongPress(Item item) {
    if (isOrphan) {
      super.onTileLongPress(item);
    } else {
      onAddModeCallBack(item);
    }
  }

  @override
  Future<bool> onWillPop() async {
    if (hasParent) Get.back();

    return super.onWillPop();
  }
}
