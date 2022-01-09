import 'package:controle_equipamentos/app/data/models/category.dart';
import 'package:controle_equipamentos/app/data/models/helpers/api_exception.dart';
import 'package:controle_equipamentos/app/data/models/item.dart';
import 'package:controle_equipamentos/app/data/models/machine.dart';
import 'package:controle_equipamentos/app/data/providers/api.dart';
import 'package:get/get.dart';

class CategoryRepository {
  //extends RelRepositoryImpl<Category> {
  Api get api => Get.find();

  @override
  Future<Category> create(
    Category category, {
    Machine machine,
    Category parent,
  }) async {
    var res = await api.createCategory(
      category,
      machine: machine,
      parent: parent,
    );

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return Category.fromMap(res.body);
  }

  @override
  Future<Category> update(Category category) async {
    var res = await api.updateCategory(category);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return Category.fromMap(res.body);
  }

  @override
  Future<Category> find(int id) async {
    var res = await api.findCategory(
      id,
    );

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return Category.fromMap(res.body);
  }

  @override
  Future<bool> delete(Category category) async {
    var res = await api.deleteCategory(category);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return res.isOk;
  }

  Future<int> countFrom(Category category) async {
    var res = await api.countCategoriesFrom(category);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return res.body;
  }

  Future<bool> assignAllItems(Category category, List<Item> items) async {
    var res = await api.assignAllItemsToCategory(category, items);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return res.isOk;
  }

  Future<List<Category>> findAllFrom(
      {Machine machine, Category category}) async {
    var res = await api.findAllCategoriesFrom(
      machine: machine,
      category: category,
    );

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return List<Category>.from(
      (res.body).map(
        (mappedMachine) => Category.fromMap(
          mappedMachine,
        ),
      ),
    );
  }

  Future<int> countItems(Category category) async {
    var res = await api.countCategoryItems(category);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return res.body;
  }

  Future<bool> isNameUnique(
    Category category, {
    Machine machine,
    Category parent,
  }) async {
    var res = await api.isCategoryNameUnique(
      category,
      machine: machine,
      parent: parent,
    );

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return res.body['result'];
  }
}
