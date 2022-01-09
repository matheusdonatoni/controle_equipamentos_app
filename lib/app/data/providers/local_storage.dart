import 'package:controle_equipamentos/app/data/models/helpers/easy_encrypter.dart';
import 'package:controle_equipamentos/app/data/models/authentication.dart';
import 'package:controle_equipamentos/app/data/models/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LSKeys {
  static final authentication = 'authentication';
  static final themeMode = 'theme_mode';
}

class LocalStorage {
  LocalStorage._();

  SharedPreferences _prefs;
  final _encrypter = EasyEncrypter();

  static Future<LocalStorage> init() async {
    var localStorage = LocalStorage._();

    localStorage._prefs = await SharedPreferences.getInstance();

    return localStorage;
  }

  Future<void> saveAuthentication(Authentication authentication) async {
    var token = _encrypter.encrypt(authentication.token);

    await _prefs.setString(
      LSKeys.authentication,
      authentication.copyWith(token: token).toJson(),
    );
  }

  Authentication findAuthentication() {
    final encryptedAuthentication = _prefs.getString(LSKeys.authentication);

    if (encryptedAuthentication == null) return Authentication();

    var authentication = Authentication.fromJson(encryptedAuthentication);

    return authentication..token = _encrypter.decrypt(authentication.token);
  }

  Future<void> cleanAuthentication() async {
    return await _prefs.setString(
      LSKeys.authentication,
      Authentication(
        user: findUser(),
      ).toJson(),
    );
  }

  User findUser() {
    final authentication = findAuthentication();

    if (authentication == null) return User();

    return authentication.user.copyWith(password: '');
  }

  Future<void> cleanPassword() async {
    await _prefs.setString(
      LSKeys.authentication,
      findAuthentication().copyWith(user: findUser()).toJson(),
    );
  }

  Future<void> saveThemeMode(ThemeMode themeMode) async {
    if (themeMode == null) {
      await _prefs.setString(LSKeys.themeMode, 'system');
    } else if (themeMode == ThemeMode.system) {
      await _prefs.setString(LSKeys.themeMode, 'system');
    } else if (themeMode == ThemeMode.light) {
      await _prefs.setString(LSKeys.themeMode, 'light');
    } else {
      await _prefs.setString(LSKeys.themeMode, 'dark');
    }
  }

  ThemeMode findThemeMode() {
    var themeMode = _prefs.getString(LSKeys.themeMode);

    if (themeMode == null || themeMode.isEmpty) {
      return ThemeMode.system;
    } else if (themeMode == 'system') {
      return ThemeMode.system;
    } else if (themeMode == 'light') {
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }
  }
}
