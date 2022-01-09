import 'package:controle_equipamentos/app/controllers/category_controllers/impl/items_tab_controller_impl.dart';
import 'package:controle_equipamentos/app/data/models/category.dart';
import 'package:controle_equipamentos/app/data/models/helpers/item_arguments.dart';
import 'package:controle_equipamentos/app/data/models/item.dart';
import 'package:controle_equipamentos/app/routes/routes.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/dialogs/confirm_delete_dialog.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/snackbars/contextual_snackbar.dart';
import 'package:get/get.dart';

import '../../data/models/helpers/implementations/controllers/state_mixin_extension.dart';

class ItemsTabController extends ItemsTabControllerImpl {
  ItemsTabController(Category parent) : super(parent);

  final tileHeight = 88.0;

  int get tileCountPerPage => Get.height ~/ tileHeight;

  Future<bool> get shouldFetchMoreData async =>
      items.length < await asyncCount();

  int get from => items.length;
  int get to => from + tileCountPerPage;

  Future<void> onLoadingPortionReached() async {
    if (await shouldFetchMoreData) {
      await findItems();
    }
  }

  Future<void> showRemoveItemDialog() async {
    await Get.dialog(
      ConfirmExclusionDialog(
        isSingleTileSelected
            ? selectedTiles.single.name
            : '${selectedTiles.length} peças',
        shouldShowRemove: true,
        onConfirmDeletePressed: () async => await removeItems(),
      ),
    );
  }

  Future<void> removeItems() async {
    for (var item in selectedTiles) {
      await itemRepository.removeFromCategory(item, parent).then(
            (val) => items.removeWhere((e) => e.id == item.id),
            onError: ContextualSnackbar.error,
          );
    }

    toggleEditMode();

    Get.back();
  }

  Future<void> pushItemPage(Item item) async {
    await Get.toNamed(
      Routes.ITEM,
      arguments: ItemArguments(
        item,
        parent: parent,
      ),
    );
  }

  Future<void> pushItemsList() async {
    await Get.toNamed(
      Routes.ITEMS_LIST,
      arguments: parent,
    );
  }

  Future<void> findItems() async {
    changeToLoading();

    await itemRepository.findAllWhere(category: parent).then(
          items.assignAll,
          onError: ContextualSnackbar.error,
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

    await findItems();
  }

  @override
  Future<void> onTileTap(Item item) async {
    if (isNotAtEditMode) {
      await pushItemPage(item);
    } else {
      onEditModeCallback(item);
    }
  }
}
