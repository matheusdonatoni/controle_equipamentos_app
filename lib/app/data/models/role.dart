import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'helpers/implementations/models.dart';

class RxRole {
  final Rxn<int> id = Rxn<int>();
  final Rxn<String> name = Rxn<String>();
  final Rxn<DateTime> createdAt = Rxn<DateTime>();
  final Rxn<DateTime> updatedAt = Rxn<DateTime>();
}

class Role extends ModelImpl<Role> {
  Role({
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

  final rx = RxRole();

  int get id => rx.id.value;
  set id(int val) => rx.id.value = val;

  String get name => rx.name.value;
  set name(String val) => rx.name.value = val;

  DateTime get createdAt => rx.createdAt.value;
  set createdAt(DateTime val) => rx.createdAt.value = val;

  DateTime get updatedAt => rx.updatedAt.value;
  set updatedAt(DateTime val) => rx.updatedAt.value = val;

  String get parsedName {
    if (this.name == 'super') return 'Super-Usuário';
    if (this.name == 'admin') return 'Usuário administrador';
    if (this.name == 'user') return 'Usuário';

    return '';
  }

  Role copyWith({
    int id,
    String name,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      Role(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  @override
  void update(Role role) {
    id = role.id;
    name = role.name;
    createdAt = role.createdAt;
    updatedAt = role.updatedAt;
  }

  factory Role.fromJson(String str) => Role.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Role.fromMap(Map<String, dynamic> json) => Role(
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
