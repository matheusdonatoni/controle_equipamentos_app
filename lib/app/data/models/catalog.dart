import 'dart:convert';
import 'package:controle_equipamentos/app/data/models/machine.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'helpers/implementations/models.dart';

class RxCatalog {
  final Rxn<int> id = Rxn<int>();
  final Rxn<int> unitId = Rxn<int>();
  final Rxn<String> name = Rxn<String>();
  final RxList<Machine> machines = RxList<Machine>([]);
  final Rxn<DateTime> createdAt = Rxn<DateTime>();
  final Rxn<DateTime> updatedAt = Rxn<DateTime>();
}

class Catalog extends ModelImpl<Catalog> {
  Catalog({
    int id,
    int unitId,
    String name,
    List<Machine> machines = const [],
    DateTime createdAt,
    DateTime updatedAt,
  }) {
    this.id = id ?? this.id;
    this.name = name ?? this.name;
    this.machines = machines ?? this.machines;
    this.unitId = unitId ?? this.unitId;
    this.createdAt = createdAt ?? this.createdAt;
    this.updatedAt = updatedAt ?? this.updatedAt;
  }

  final rx = RxCatalog();

  int get id => rx.id.value;
  set id(int val) => rx.id.value = val;

  int get unitId => rx.unitId.value;
  set unitId(int val) => rx.unitId.value = val;

  String get name => rx.name.value;
  set name(String val) => rx.name.value = val;

  List<Machine> get machines => rx.machines;
  set machines(List<Machine> val) => rx.machines.value = val;

  DateTime get createdAt => rx.createdAt.value;
  set createdAt(DateTime val) => rx.createdAt.value = val;

  DateTime get updatedAt => rx.updatedAt.value;
  set updatedAt(DateTime val) => rx.updatedAt.value = val;

  Catalog copyWith({
    int id,
    int unitId,
    String name,
    List<Machine> machines,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      Catalog(
        id: id ?? this.id,
        name: name ?? this.name,
        machines: machines ?? this.machines,
        unitId: unitId ?? this.unitId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  @override
  void update(Catalog catalog) {
    id = catalog.id;
    unitId = catalog.unitId;
    name = catalog.name;
    machines = catalog.machines;
    createdAt = catalog.createdAt;
    updatedAt = catalog.updatedAt;
  }

  int get machineCount => machines.length;

  bool get hasMachines => machines.length > 0;

  bool get isNew => id == null;

  void addMachine(Machine machine) {
    machines.add(machine);
  }

  void deleteMachine(Machine machine) {
    machines.removeWhere((_machine) => _machine.id == machine.id);
  }

  factory Catalog.fromJson(String str) => Catalog.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Catalog.fromMap(Map<String, dynamic> json) => Catalog(
        id: json["id"] == null ? null : json["id"],
        unitId: json["unitId"] == null ? null : json["unitId"],
        name: json["name"] == null ? null : json["name"],
        machines: json["machines"] == null
            ? []
            : List<Machine>.from(
                json["machines"].map((x) => Machine.fromMap(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "unitId": unitId == null ? null : unitId,
        "name": name == null ? null : name,
        "machines": machines == null
            ? []
            : List<dynamic>.from(machines.map((x) => x.toMap())),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": createdAt == null ? null : createdAt.toIso8601String(),
      };

  @override
  String toString() {
    return this.toMap().toString();
  }
}
