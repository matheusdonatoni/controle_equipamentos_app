import 'package:get/get.dart';
import '../models.dart';

mixin SelectableRxList<T extends ModelImpl> {
  int get selectionLimit => null;
  final RxList<T> selectedTiles = RxList([]);

  bool get isSingleSelection => selectionLimit == 1;
  bool get isSelectedTilesEmpty => selectedTiles.isEmpty;
  bool get isSingleTileSelected => selectedTiles.length == 1;
  bool get isMultiTilesSelected => selectedTiles.length > 1;

  final _isAtEditMode = false.obs;
  bool get isAtEditMode => _isAtEditMode();
  bool get isNotAtEditMode => !isAtEditMode;

  Future<bool> onWillPop() async {
    if (isAtEditMode) {
      toggleEditMode();

      return false;
    }

    return true;
  }

  void toggleEditMode() {
    if (isAtEditMode) selectedTiles.clear();

    _isAtEditMode.toggle();
  }

  void exitEditMode() {
    if (isAtEditMode) {
      toggleEditMode();
    }
  }

  bool isTileSelected(T type) => selectedTiles.any(
        (selected) => selected.id == type.id,
      );

  void onTileLongPress(T type) {
    if (isNotAtEditMode) {
      toggleEditMode();

      selectedTiles.add(type);
    } else {
      onEditModeCallback(type);
    }
  }

  Future<void> onTileTap(T type);

  void onEditModeCallback(T type) {
    if (isTileSelected(type)) {
      selectedTiles.removeWhere((element) => element.id == type.id);

      if (isSelectedTilesEmpty) toggleEditMode();
    } else {
      handleSelectionLimit(type);
    }
  }

  void handleSelectionLimit(T type) {
    if (selectionLimit == null) {
      selectedTiles.add(type);
    } else if (isSingleSelection) {
      selectedTiles.clear();
      selectedTiles.add(type);
    } else if (selectionLimit > selectedTiles.length) {
      selectedTiles.add(type);
    }
  }
}
