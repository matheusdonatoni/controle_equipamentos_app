import 'package:controle_equipamentos/app/controllers/category_controllers/items_tab_controller.dart';
import 'package:controle_equipamentos/app/controllers/items_list_controller/items_list_controller.dart';
import 'package:controle_equipamentos/app/data/models/category.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/controllers/getx_controller_impl.dart';
import 'package:controle_equipamentos/app/data/models/item.dart';
import 'package:controle_equipamentos/app/data/repositories/item_repository.dart';
import 'package:get/get.dart';


class ItemControllerImpl extends GetxControllerImpl<Item> {
  ItemControllerImpl(this.parent, this.reference);

  ItemRepository get itemRepository => Get.find();

  ItemsListController get _itemsListController => Get.find();
  ItemsTabController get _itemsTabController => Get.find(
        tag: parent?.id?.toString(),
      );

  final Item reference;
  final Category parent;

  bool get isOrphan => parent == null;
  bool get hasParent => !isOrphan;

  RxList<Item> get items =>
      isOrphan ? _itemsListController.items : _itemsTabController.items;

  int get _index => items.indexWhere((e) => e.id == reference.id);

  Item get item => _index == -1 ? null : items[_index];

  @override
  get initial => item;

  @override
  get stream => items.stream.map((items) => item);
}
