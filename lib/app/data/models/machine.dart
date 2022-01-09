import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

import './category.dart';
import './picture.dart';
import './sector.dart';
import './item.dart';

import 'helpers/implementations/models.dart';

class RxMachine {
  final Rxn<int> id = Rxn<int>();
  final Rxn<String> name = Rxn<String>();
  final Rxn<String> brand = Rxn<String>();
  final Rxn<String> code = Rxn<String>();
  final Rxn<String> model = Rxn<String>();
  final Rxn<String> tag = Rxn<String>();
  final Rxn<Sector> sector = Rxn<Sector>();
  final Rxn<Picture> picture = Rxn<Picture>();
  final RxList<Category> categories = RxList<Category>([]);
  final Rxn<DateTime> createdAt = Rxn<DateTime>();
  final Rxn<DateTime> updatedAt = Rxn<DateTime>();
}

class Machine extends ModelImpl<Machine> {
  Machine({
    int id,
    String name,
    String brand,
    String code,
    String model,
    String tag,
    Sector sector,
    Picture picture,
    List<Category> categories = const [],
    DateTime createdAt,
    DateTime updatedAt,
  }) {
    this.id = id ?? this.id;
    this.name = name ?? this.name;
    this.brand = brand ?? this.brand;
    this.sector = sector ?? this.sector;
    this.code = code ?? this.code;
    this.model = model ?? this.model;
    this.tag = tag ?? this.tag;
    this.picture = picture ?? this.picture;
    this.categories = categories ?? this.categories;
    this.createdAt = createdAt ?? this.createdAt;
    this.updatedAt = updatedAt ?? this.updatedAt;
  }

  final rx = RxMachine();

  int get id => rx.id.value;
  set id(int val) => rx.id.value = val;

  String get name => rx.name.value;
  set name(String val) => rx.name.value = val;

  String get brand => rx.brand.value;
  set brand(String val) => rx.brand.value = val;

  String get code => rx.code.value;
  set code(String val) => rx.code.value = val;

  String get model => rx.model.value;
  set model(String val) => rx.model.value = val;

  String get tag => rx.tag.value;
  set tag(String val) => rx.tag.value = val;

  Picture get picture => rx.picture.value;
  set picture(Picture val) => rx.picture.value = val;

  List<Category> get categories => rx.categories;
  set categories(List<Category> val) => rx.categories.value = val;

  Sector get sector => rx.sector.value;
  set sector(Sector val) => rx.sector.value = val;

  DateTime get createdAt => rx.createdAt.value;
  set createdAt(DateTime val) => rx.createdAt.value = val;

  DateTime get updatedAt => rx.updatedAt.value;
  set updatedAt(DateTime val) => rx.updatedAt.value = val;

  Machine copyWith({
    int id,
    String name,
    String brand,
    Sector sector,
    String code,
    String model,
    String tag,
    Picture picture,
    List<Category> categories,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      Machine(
        id: id ?? this.id,
        name: name ?? this.name,
        brand: brand ?? this.brand,
        sector: sector ?? this.sector,
        code: code ?? this.code,
        model: model ?? this.model,
        tag: tag ?? this.tag,
        picture: picture ?? this.picture,
        categories: categories ?? this.categories,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Machine forDuplication() => Machine(
        id: null,
        name: null,
        brand: this.brand,
        sector: this.sector,
        code: null,
        model: this.model,
        tag: this.tag,
        picture: this.picture,
        categories: this.categories,
        createdAt: null,
        updatedAt: null,
      );

  String get resume => '''$brand, $model\n$tag''';

  int get categoriesCount => categories?.length;

  bool get hasCategories => categories.length > 0;

  @override
  void update(Machine machine) {
    id = machine.id;
    name = machine.name;
    code = machine.code;
    sector = machine.sector;
    model = machine.model;
    tag = machine.tag;
    picture = machine.picture;
    categories = machine.categories;
    brand = machine.brand;
    createdAt = machine.createdAt;
    updatedAt = machine.updatedAt;
  }

  void addCategory(Category category) {
    categories.add(category);
  }

  void deleteCategory(Category category) {
    categories.removeWhere((_category) => _category.id == category.id);
  }

  void updateItemFromAllCategories(Item item) {
    categories.forEach(
      (category) => category.updateItemFromAllCategories(item),
    );
  }

  void deleteItemFromAllCategories(int id) {
    categories.forEach((category) {
      category.deleteItemFromAllCategories(id);
    });
  }

  factory Machine.fromJson(String str) => Machine.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Machine.fromMap(Map<String, dynamic> json) => Machine(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        brand: json["brand"] == null ? null : json["brand"],
        code: json["code"] == null ? null : json["code"],
        model: json["model"] == null ? null : json["model"],
        sector: json["sector"] == null ? null : Sector.fromMap(json["sector"]),
        tag: json["tag"] == null ? null : json["tag"],
        picture:
            json["picture"] == null ? null : Picture.fromMap(json["picture"]),
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
        "brand": brand == null ? null : brand,
        "code": code == null ? null : code,
        "sector": sector == null ? null : sector.toMap(),
        "model": model == null ? null : model,
        "tag": tag == null ? null : tag,
        "picture": picture == null ? null : picture.toMap(),
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
