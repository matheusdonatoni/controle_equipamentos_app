import 'package:controle_equipamentos/app/data/models/category.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/controllers/async_tab_counter_mixin.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/controllers/getx_controller_impl.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/controllers/selectable_rx_list.dart';
import 'package:controle_equipamentos/app/data/models/item.dart';
import 'package:controle_equipamentos/app/data/repositories/category_repository.dart';
import 'package:controle_equipamentos/app/data/repositories/item_repository.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/snackbars/contextual_snackbar.dart';
import 'package:get/get.dart';

import '../category_controller.dart';

abstract class ItemsTabControllerImpl extends GetxControllerImpl<List<Item>>
    with SelectableRxList<Item>, AsyncTabCounterMixin<Item> {
  ItemsTabControllerImpl(this.parent);

  final Category parent;

  CategoryRepository get categoryRepository => Get.find();
  ItemRepository get itemRepository => Get.find();

  CategoryController get _categoryController => Get.find(
        tag: parent.id.toString(),
      );

  RxList<Item> get items => parent.rx.items;

  Future<int> asyncCount() async {
    return await categoryRepository.countItems(parent).catchError(
          ContextualSnackbar.error,
        );
  }

  void addTabListener() => _categoryController.tabController.addListener(
        exitEditMode,
      );

  @override
  get initial => items;

  @override
  get stream => items.stream;

  @override
  void onData(items) async {
    updateCounter(asyncCount);
  }
}
