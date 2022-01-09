import 'dart:convert';

import 'package:controle_equipamentos/app/data/models/helpers/implementations/models.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class RxMeasurement {
  final Rxn<int> id = Rxn<int>();
  final Rxn<String> name = Rxn<String>();
  final Rxn<DateTime> createdAt = Rxn<DateTime>();
  final Rxn<DateTime> updatedAt = Rxn<DateTime>();
}

class Measurement extends ModelImpl<Measurement> {
  Measurement({
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

  final rx = RxMeasurement();

  int get id => rx.id.value;
  set id(int val) => rx.id.value = val;

  String get name => rx.name.value;
  set name(String val) => rx.name.value = val;

  DateTime get createdAt => rx.createdAt.value;
  set createdAt(DateTime val) => rx.createdAt.value = val;

  DateTime get updatedAt => rx.updatedAt.value;
  set updatedAt(DateTime val) => rx.updatedAt.value = val;

  Measurement copyWith({
    int id,
    String name,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      Measurement(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  @override
  void update(Measurement measurement) {
    id = measurement.id;
    name = measurement.name;
    createdAt = measurement.createdAt;
    updatedAt = measurement.updatedAt;
  }

  factory Measurement.fromJson(String str) =>
      Measurement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Measurement.fromMap(Map<String, dynamic> json) => Measurement(
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
}
