import 'dart:convert';
import 'package:controle_equipamentos/app/data/models/picture.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'catalog.dart';
import './machine.dart';
import './role.dart';
import './unit.dart';

import 'helpers/implementations/models.dart';

class RxUser {
  final Rxn<int> id = Rxn<int>();
  final Rxn<Unit> unit = Rxn<Unit>();
  final Rxn<String> name = Rxn<String>();
  final Rxn<String> email = Rxn<String>();
  final Rxn<String> password = Rxn<String>();
  final Rxn<Picture> picture = Rxn<Picture>();
  final RxList<Machine> machines = RxList<Machine>([]);
  final Rxn<Role> role = Rxn<Role>();
  final Rxn<DateTime> createdAt = Rxn<DateTime>();
  final Rxn<DateTime> updatedAt = Rxn<DateTime>();
}

class User extends ModelImpl<User> {
  User({
    int id,
    Unit unit,
    String name,
    String email,
    String password,
    Picture picture,
    List<Machine> machines = const [],
    Role role,
    DateTime createdAt,
    DateTime updatedAt,
  }) {
    this.id = id ?? this.id;
    this.unit = unit ?? this.unit;
    this.name = name ?? this.name;
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.picture = picture ?? this.picture;
    this.machines = machines ?? this.machines;
    this.role = role ?? this.role;
    this.createdAt = createdAt ?? this.createdAt;
    this.updatedAt = updatedAt ?? this.updatedAt;
  }

  final rx = RxUser();

  int get id => rx.id.value;
  set id(int val) => rx.id.value = val;

  Unit get unit => rx.unit.value;
  set unit(Unit val) => rx.unit.value = val;

  String get name => rx.name.value;
  set name(String val) => rx.name.value = val;

  String get email => rx.email.value;
  set email(String val) => rx.email.value = val;

  String get password => rx.password.value;
  set password(String val) => rx.password.value = val;

  List<Machine> get machines => rx.machines;
  set machines(List<Machine> val) => rx.machines.value = val;

  Picture get picture => rx.picture.value;
  set picture(Picture val) => rx.picture.value = val;

  Role get role => rx.role.value;
  set role(Role val) => rx.role.value = val;

  DateTime get createdAt => rx.createdAt.value;
  set createdAt(DateTime val) => rx.createdAt.value = val;

  DateTime get updatedAt => rx.updatedAt.value;
  set updatedAt(DateTime val) => rx.updatedAt.value = val;

  Catalog get catalog => unit.catalog;
  set catalog(Catalog val) => unit.catalog = val;

  User copyWith({
    int id,
    Unit unit,
    String name,
    String email,
    String password,
    Picture picture,
    List<Machine> machines,
    Role role,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      User(
        id: id ?? this.id,
        unit: unit ?? this.unit,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        picture: picture ?? this.picture,
        machines: machines ?? this.machines,
        role: role ?? this.role,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  @override
  void update(User user) {
    id = user.id;
    unit = user.unit;
    name = user.name;
    email = user.email;
    password = user.password;
    picture = user.picture;
    machines = user.machines;
    role = user.role;
    createdAt = user.createdAt;
    updatedAt = user.updatedAt;
  }

  int get unitId => unit?.id;

  int get roleId => role?.id;

  int get catalogId => catalog?.id;

  bool get isAdmin => role?.name == 'admin' || role?.name == 'super';

  bool get isSuperUser => role?.name == 'super';

  bool get hasCatalog => catalog != null;

  String get firstName => name?.split(' ')?.first;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        unit: json["unit"] == null ? null : Unit.fromMap(json["unit"]),
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        picture:
            json["picture"] == null ? null : Picture.fromMap(json["picture"]),
        machines: json["machines"] == null
            ? []
            : List<Machine>.from(
                json["machines"].map((x) => Machine.fromMap(x))),
        role: json["role"] == null ? null : Role.fromMap(json["role"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "unit": unit == null ? null : unit.toMap(),
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "picture": picture == null ? null : picture.toMap(),
        "machines": machines == null
            ? []
            : List<dynamic>.from(machines.map((x) => x.toMap())),
        "role": role == null ? null : role.toMap(),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": createdAt == null ? null : createdAt.toIso8601String(),
      };

  @override
  String toString() {
    return this.toMap().toString();
  }
}
