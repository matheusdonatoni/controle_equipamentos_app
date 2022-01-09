import 'dart:convert';
import 'dart:io';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'helpers/implementations/models.dart';

import 'package:get/get.dart';

class RxPicture {
  final Rxn<int> id = Rxn<int>();
  final Rxn<String> url = Rxn<String>();
  final Rxn<String> name = Rxn<String>();
  final Rxn<int> size = Rxn<int>();
  final Rxn<File> file = Rxn<File>();
  final Rxn<DateTime> createdAt = Rxn<DateTime>();
  final Rxn<DateTime> updatedAt = Rxn<DateTime>();
}

class Picture extends ModelImpl<Picture> {
  Picture({
    int id,
    String url,
    String name,
    int size,
    File file,
    DateTime createdAt,
    DateTime updatedAt,
  }) : assert(file != null ||
            (id != null &&
                url != null &&
                name != null &&
                size != null &&
                createdAt != null &&
                updatedAt != null)) {
    this.id = id ?? this.id;
    this.url = url ?? this.url;
    this.name = name ?? this.name;
    this.size = size ?? this.size;
    this.file = file ?? this.file;
    this.createdAt = createdAt ?? this.createdAt;
    this.updatedAt = updatedAt ?? this.updatedAt;
  }

  final rx = RxPicture();

  int get id => rx.id.value;
  set id(int val) => rx.id.value = val;

  String get url => rx.url.value;
  set url(String val) => rx.url.value = val;

  String get name => rx.name.value;
  set name(String val) => rx.name.value = val;

  String get type => name?.split('.')?.last;

  int get size => rx.size.value;
  set size(int val) => rx.size.value = val;

  File get file => rx.file.value;
  set file(File val) => rx.file.value = val;

  DateTime get createdAt => rx.createdAt.value;
  set createdAt(DateTime val) => rx.createdAt.value = val;

  DateTime get updatedAt => rx.updatedAt.value;
  set updatedAt(DateTime val) => rx.updatedAt.value = val;

  bool get hasUrl {
    if (url == null) return false;

    return url.isNotEmpty;
  }

  bool get hasFile => file != null;

  bool get isNew => id == null;
  bool get isOld => !isNew;
  bool get existsOnServer => isOld;

  Picture copyWith({
    int id,
    String url,
    String name,
    int size,
    File file,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      Picture(
        id: id ?? this.id,
        url: url ?? this.url,
        name: name ?? this.name,
        size: size ?? this.size,
        file: file ?? this.file,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Picture.fromFile(File file) => Picture(
        name: file.path.split('/').last,
        file: file,
      );

  @override
  void update(Picture picture) {
    id = picture.id;
    url = picture.url;
    file = picture.file;
    createdAt = picture.createdAt;
    updatedAt = picture.updatedAt;
  }

  factory Picture.fromJson(String str) => Picture.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Picture.fromMap(Map<String, dynamic> json) => Picture(
        id: json["id"] == null ? null : json["id"],
        url: json["url"] == null ? null : json["url"],
        name: json["name"] == null ? null : json["name"],
        size: json["size"] == null ? null : json["size"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "url": url == null ? null : url,
        "size": size == null ? null : size,
        "name": name == null ? null : name,
        "type": type == null ? null : type,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": createdAt == null ? null : createdAt.toIso8601String(),
      };

  @override
  String toString() {
    return (this.toMap()
          ..addAll({
            "file": file,
          }))
        .toString();
  }
}
