import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'user.dart';

class RxAuthentication {
  Rx<User> user = Rx<User>(User());
  Rx<String> token = Rx<String>('');
  Rxn<DateTime> generatedAt = Rxn<DateTime>();
  Rx<int> expiresIn = Rx<int>(0);
}

class Authentication {
  Authentication({
    User user,
    String token,
    DateTime generatedAt,
    int expiresIn,
  }) {
    this.user = user ?? this.user;
    this.token = token ?? '';
    this.generatedAt = generatedAt ?? this.generatedAt;
    this.expiresIn = expiresIn ?? 0;
  }

  final rx = RxAuthentication();

  User get user => rx.user.value;
  set user(User val) => rx.user.value = val;

  String get token => rx.token.value;
  set token(String val) => rx.token.value = val;

  DateTime get generatedAt => rx.generatedAt.value;
  set generatedAt(DateTime val) => rx.generatedAt.value = val;

  DateTime get expiresAt => generatedAt?.add(Duration(seconds: expiresIn));

  int get expiresIn => rx.expiresIn.value;
  set expiresIn(int val) => rx.expiresIn.value = val;

  bool get expired {
    if (generatedAt == null) return true;

    return expiresAt.isBefore(DateTime.now());
  }

  bool get notExpired => !expired;

  bool get isValidLocally => token.isNotEmpty && notExpired;

  Authentication copyWith({
    User user,
    String token,
    DateTime generatedAt,
    int expiresIn,
  }) =>
      Authentication(
        user: user ?? this.user,
        token: token ?? this.token,
        generatedAt: generatedAt ?? this.generatedAt,
        expiresIn: expiresIn ?? this.expiresIn,
      );

  factory Authentication.fromJson(String str) {
    return Authentication.fromMap(json.decode(str));
  }

  String toJson() => json.encode(toMap());

  factory Authentication.fromMap(Map<String, dynamic> json) => Authentication(
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        token: json["token"] == null ? null : json["token"],
        generatedAt: json["generatedAt"] == null
            ? null
            : DateTime.parse(json["generatedAt"]),
        expiresIn: json["expiresIn"] == null ? null : json["expiresIn"],
      );

  Map<String, dynamic> toMap() => {
        "user": user == null ? null : user.toMap(),
        "token": token == null ? null : token,
        "generatedAt":
            generatedAt == null ? null : generatedAt.toIso8601String(),
        "expiresIn": expiresIn == null ? null : expiresIn,
      };

  @override
  String toString() {
    return this.toMap().toString();
  }
}
