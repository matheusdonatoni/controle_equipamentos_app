import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'helpers/implementations/models.dart';

class RxSector {
  final Rxn<int> id = Rxn<int>();
  final Rxn<String> name = Rxn<String>();
  final Rxn<DateTime> createdAt = Rxn<DateTime>();
  final Rxn<DateTime> updatedAt = Rxn<DateTime>();
}

class Sector extends ModelImpl<Sector> {
  Sector({
    int id,
    String name,
    DateTime createdAt,
    DateTime updatedAt,
  }) {
    this.id = id ?? this.id;
    this.name = name ?? this.name;
    this.createdAt = createdAt ?? this.createdAt;
    this.updatedAt = updatedAt ?? this.updatedAt;
  }

  final rx = RxSector();

  int get id => rx.id.value;
  set id(int val) => rx.id.value = val;

  String get name => rx.name.value;
  set name(String val) => rx.name.value = val;

  DateTime get createdAt => rx.createdAt.value;
  set createdAt(DateTime val) => rx.createdAt.value = val;

  DateTime get updatedAt => rx.updatedAt.value;
  set updatedAt(DateTime val) => rx.updatedAt.value = val;

  Sector copyWith({
    int id,
    String name,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      Sector(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  @override
  void update(Sector sector) {
    id = sector.id;
    name = sector.name;
    createdAt = sector.createdAt;
    updatedAt = sector.updatedAt;
  }

  factory Sector.fromJson(String str) => Sector.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Sector.fromMap(Map<String, dynamic> json) => Sector(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
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
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": createdAt == null ? null : createdAt.toIso8601String(),
      };

  @override
  String toString() {
    return this.toMap().toString();
  }
}
