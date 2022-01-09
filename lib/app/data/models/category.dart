import 'dart:convert';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'helpers/implementations/models.dart';
import './item.dart';

class RxCategory {
  Rxn<int> id = Rxn<int>();
  Rxn<String> name = Rxn<String>();
  RxList<Category> categories = RxList<Category>([]);
  RxList<Item> items = RxList<Item>([]);
  Rxn<DateTime> createdAt = Rxn<DateTime>();
  Rxn<DateTime> updatedAt = Rxn<DateTime>();
}

class Category extends ModelImpl<Category> {
  Category({
    int id,
    String name,
    List<Item> items = const [],
    List<Category> categories = const [],
    DateTime createdAt,
    DateTime updatedAt,
  }) {
    this.id = id ?? this.id;
    this.name = name ?? this.name;
    this.items = items ?? this.items;
    this.categories = categories ?? this.categories;
    this.createdAt = createdAt ?? this.createdAt;
    this.updatedAt = updatedAt ?? this.updatedAt;
  }

  final rx = RxCategory();

  int get id => rx.id.value;
  set id(int val) => rx.id.value = val;

  String get name => rx.name.value;
  set name(String val) => rx.name.value = val;

  List<Item> get items => rx.items;
  set items(List<Item> val) => rx.items.value = val;

  List<Category> get categories => rx.categories;
  set categories(List<Category> val) => rx.categories.value = val;

  DateTime get createdAt => rx.createdAt.value;
  set createdAt(DateTime val) => rx.createdAt.value = val;

  DateTime get updatedAt => rx.updatedAt.value;
  set updatedAt(DateTime val) => rx.updatedAt.value = val;

  Category copyWith({
    int id,
    String name,
    List<Item> items,
    List<Category> categories,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        items: items ?? this.items,
        categories: categories ?? this.categories,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  @override
  void update(Category category) {
    id = category.id;
    name = category.name;
    items = category.items;
    categories = category.categories;
    createdAt = category.createdAt;
    updatedAt = category.updatedAt;
  }

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  int get categoryCount => categories.length;
  int get itemCount => items.length;

  bool get hasCategories => categoryCount > 0;
  bool get hasItems => itemCount > 0;

  bool get isEmpty => !hasCategories && !hasItems;

  bool containsItem(int id) {
    return items.any((item) => item.id == id);
  }

  void addCategory(Category category) {
    categories.add(category);
  }

  void deleteCategory(int id) {
    categories.removeWhere((category) => category.id == id);
  }

  void addItem(Item item) {
    items.add(item);
  }

  void removeItem(int id) {
    deleteItem(id);
  }

  void deleteItem(int id) {
    items.removeWhere((item) => item.id == id);
  }

  void updateItemFromAllCategories(Item item) {
    items.forEach((_item) {
      if (_item.id == item.id) _item.update(item);
    });

    categories.forEach(
      (category) => category.updateItemFromAllCategories(item),
    );
  }

  void deleteItemFromAllCategories(int id) {
    deleteItem(id);

    categories.forEach(
      (category) => category.deleteItemFromAllCategories(id),
    );
  }

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"].map((x) => Category.fromMap(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "items": items == null
            ? []
            : List<dynamic>.from(items.map((x) => x.toMap())),
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories.map((x) => x.toMap())),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": createdAt == null ? null : createdAt.toIso8601String(),
      };

  @override
  String toString() {
    return this.toMap().toString();
  }
}
