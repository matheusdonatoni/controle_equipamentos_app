import 'package:controle_equipamentos/app/data/models/category.dart';
import 'package:controle_equipamentos/app/data/models/helpers/api_exception.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/repositories/picture_mixin.dart';
import 'package:controle_equipamentos/app/data/models/item.dart';
import 'package:controle_equipamentos/app/data/providers/api.dart';
import 'package:controle_equipamentos/app/data/repositories/picture_repository.dart';
import 'package:get/get.dart';

class ItemRepository with PictureManagerMixin {
  ItemRepository();

  final pictureRepository = PictureRepository();

  Api get api => Get.find();

  Future<int> count() async {
    var res = await api.countItems();

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return res.body;
  }

  Future<List<Item>> findAllWhere({Category category, int from, int to}) async {
    var res = await api.findItemsSlice(
      category: category,
      from: from,
      to: to,
    );

    if (res.hasError) {
      throw ApiException(res.body);
    }

    var items = List<Item>.from(
      (res.body as List).map(
        (item) => Item.fromMap(item),
      ),
    );

    await Future.forEach<Item>(
      items,
      (item) async => item
        ..picture = await findPicture(
          item.picture.id,
        ),
    );

    return items;
  }

  Future<Item> create(Item item) async {
    item.picture = await createPicture(item.picture);

    var res = await api.createItem(item);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    item = Item.fromMap(res.body);

    return item..picture = await findPicture(item.picture.id);
  }

  Future<Item> update(Item item) async {
    item.picture = await createPicture(item.picture);

    var res = await api.updateItem(item);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    item = Item.fromMap(res.body);

    return item..picture = await findPicture(item.picture.id);
  }

  Future<Item> find(int id) async {
    var res = await api.findItem(
      id,
    );

    if (res.hasError) {
      throw ApiException(res.body);
    }

    var item = Item.fromMap(res.body);

    return item..picture = await findPicture(item.picture.id);
  }

  Future<bool> delete(Item item) async {
    var res = await api.deleteItem(item);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return res.isOk;
  }

  Future<bool> addToCategory(
    Item item,
    Category category,
  ) async {
    var res = await api.addItemToCategory(item, category);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return res.isOk;
  }

  Future<bool> removeFromCategory(
    Item item,
    Category category,
  ) async {
    var res = await api.removeItemFromCategory(item, category);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return res.isOk;
  }

  Future<bool> isNameUnique(Item item) async {
    var res = await api.isItemNameUnique(item);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return res.body['result'];
  }

  Future<bool> isCodeUnique(Item item) async {
    var res = await api.isItemCodeUnique(item);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return res.body['result'];
  }
}
