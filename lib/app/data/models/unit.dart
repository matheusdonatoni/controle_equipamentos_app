import 'dart:convert';
import 'catalog.dart';
import './user.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'helpers/implementations/models.dart';

class RxUnit {
  final Rxn<int> id = Rxn<int>();
  final Rxn<String> name = Rxn<String>();
  final Rxn<String> code = Rxn<String>();
  final RxList<User> users = RxList<User>([]);
  final Rxn<Catalog> catalog = Rxn<Catalog>();
  final Rxn<DateTime> createdAt = Rxn<DateTime>();
  final Rxn<DateTime> updatedAt = Rxn<DateTime>();
}

class Unit extends ModelImpl<Unit> {
  Unit({
    int id,
    String name,
    String code,
    List<User> users = const [],
    Catalog catalog,
    DateTime createdAt,
    DateTime updatedAt,
  }) {
    this.id = id ?? this.id;
    this.name = name ?? this.name;
    this.code = code ?? this.code;
    this.users = users ?? this.users;
    this.catalog = catalog ?? this.catalog;
    this.createdAt = createdAt ?? this.createdAt;
    this.updatedAt = updatedAt ?? this.updatedAt;
  }

  final rx = RxUnit();

  int get id => rx.id.value;
  set id(int val) => rx.id.value = val;

  String get name => rx.name.value;
  set name(String val) => rx.name.value = val;

  String get code => rx.code.value;
  set code(String val) => rx.code.value = val;

  List<User> get users => rx.users;
  set users(List<User> val) => rx.users.value = val;

  DateTime get createdAt => rx.createdAt.value;
  set createdAt(DateTime val) => rx.createdAt.value = val;

  Catalog get catalog => rx.catalog.value;
  set catalog(Catalog val) => rx.catalog.value = val;

  DateTime get updatedAt => rx.updatedAt.value;
  set updatedAt(DateTime val) => rx.updatedAt.value = val;

  Unit copyWith({
    int id,
    String name,
    String code,
    List<User> users,
    Catalog catalog,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      Unit(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
        users: users ?? this.users,
        catalog: catalog ?? this.catalog,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  @override
  void update(Unit unit) {
    id = unit.id;
    name = unit.name;
    code = unit.code;
    users = unit.users;
    catalog = unit.catalog;
    createdAt = unit.createdAt;
    updatedAt = unit.updatedAt;
  }

  factory Unit.fromJson(String str) => Unit.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Unit.fromMap(Map<String, dynamic> json) => Unit(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        code: json["code"] == null ? null : json["code"],
        users: json["users"] == null
            ? []
            : List<User>.from(json["users"].map((x) => User.fromMap(x))),
        catalog:
            json["catalog"] == null ? null : Catalog.fromMap(json["catalog"]),
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
        "code": code == null ? null : code,
        "users": users == null
            ? []
            : List<dynamic>.from(users.map((x) => x.toMap())),
        "catalog": catalog == null ? null : catalog.toMap(),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": createdAt == null ? null : createdAt.toIso8601String(),
      };

  @override
  String toString() {
    return this.toMap().toString();
  }
}
