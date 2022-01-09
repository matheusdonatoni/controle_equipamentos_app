import 'package:flutter/material.dart';

class SwiftTheme {
  static final light = ThemeData(
    primarySwatch: Colors.deepOrange,
    textTheme: ThemeData.light().textTheme,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    primarySwatch: Colors.deepOrange,
    textTheme: ThemeData.dark().textTheme,
    brightness: Brightness.dark,
    primaryColor: Colors.deepOrange[900],
    primaryColorLight: Colors.deepOrange[900],
    toggleableActiveColor: Colors.deepOrange[900],
    accentColor: Colors.deepOrange[900],
  );
}
