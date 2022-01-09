import 'dart:convert';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import './measurement.dart';
import './picture.dart';

import 'helpers/implementations/models.dart';

class RxItem {
  final Rxn<int> id = Rxn<int>();
  final Rxn<String> name = Rxn<String>();
  final Rxn<String> description = Rxn<String>();
  final Rxn<String> code = Rxn<String>();
  final Rxn<Measurement> measurement = Rxn<Measurement>();
  final Rxn<Picture> picture = Rxn<Picture>();
  final Rxn<DateTime> createdAt = Rxn<DateTime>();
  final Rxn<DateTime> updatedAt = Rxn<DateTime>();
}

class Item extends ModelImpl<Item> {
  Item({
    int id,
    String name,
    String description,
    Measurement measurement,
    String code,
    Picture picture,
    DateTime createdAt,
    DateTime updatedAt,
  }) {
    this.id = id ?? this.id;
    this.name = name ?? this.name;
    this.description = description ?? this.description;
    this.measurement = measurement ?? this.measurement;
    this.code = code ?? this.code;
    this.picture = picture ?? this.picture;
    this.createdAt = createdAt ?? this.createdAt;
    this.updatedAt = updatedAt ?? this.updatedAt;
  }

  final rx = RxItem();

  int get id => rx.id.value;
  set id(int val) => rx.id.value = val;

  String get name => rx.name.value;
  set name(String val) => rx.name.value = val;

  String get description => rx.description.value;
  set description(String val) => rx.description.value = val;

  Measurement get measurement => rx.measurement.value;
  set measurement(Measurement val) => rx.measurement.value = val;

  String get code => rx.code.value;
  set code(String val) => rx.code.value = val;

  Picture get picture => rx.picture.value;
  set picture(Picture val) => rx.picture.value = val;

  DateTime get createdAt => rx.createdAt.value;
  set createdAt(DateTime val) => rx.createdAt.value = val;

  DateTime get updatedAt => rx.updatedAt.value;
  set updatedAt(DateTime val) => rx.updatedAt.value = val;

  Item copyWith({
    int id,
    String name,
    String description,
    Measurement measurement,
    String code,
    Picture picture,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      Item(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        measurement: measurement ?? this.measurement,
        code: code ?? this.code,
        picture: picture ?? this.picture,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  @override
  void update(Item item) {
    id = item.id;
    name = item.name;
    code = item.code;
    description = item.description;
    measurement = item.measurement;
    picture = item.picture;
    createdAt = item.createdAt;
    updatedAt = item.updatedAt;
  }

  String get resume => '$code - ${measurement.name}\n$description';

  bool get isNew => id == null;

  int get measurementId => measurement.id;

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        measurement: json["measurement"] == null
            ? null
            : Measurement.fromMap(json["measurement"]),
        code: json["code"] == null ? null : json["code"],
        picture:
            json["picture"] == null ? null : Picture.fromMap(json["picture"]),
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
        "description": description == null ? null : description,
        "measurement": measurement == null ? null : measurement.toMap(),
        "code": code == null ? null : code,
        "picture": picture == null ? null : picture.toMap(),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": createdAt == null ? null : createdAt.toIso8601String(),
      };

  @override
  String toString() {
    return this.toMap().toString();
  }
}
