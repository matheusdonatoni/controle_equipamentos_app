import 'package:controle_equipamentos/app/data/models/category.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/controllers/getx_controller_impl.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/controllers/selectable_rx_list.dart';
import 'package:controle_equipamentos/app/data/models/item.dart';
import 'package:controle_equipamentos/app/data/repositories/item_repository.dart';
import 'package:get/get.dart';

abstract class ItemsListControllerImpl extends GetxControllerImpl<List<Item>>
    with SelectableRxList<Item> {
  ItemsListControllerImpl(this.parent);

  final Category parent;

  ItemRepository get itemRepository => Get.find();

  final items = RxList<Item>();

  bool get hasParent => parent != null;
  bool get isOrphan => !hasParent;

  @override
  get initial => items;

  @override
  get stream => items.stream;
}
