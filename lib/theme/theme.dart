import 'package:flutter/material.dart';
// import 'package:adaptive_theme/adaptive_theme.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade300,
    primary: Colors.white,
    secondary: Colors.grey.shade200,
    shadow: Colors.grey.withOpacity(0.5),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade700,
    secondary: Colors.grey.shade800,
    shadow: Colors.grey.shade900,
  ),
);

typedef ColorMap = Map<String, Map<String, Color>>;

extension FetchColorMap on ColorMap {
  Color fetch({required String item, required String brightness}) {
    return this[item]![brightness]!;
  }
}

final checkBoxColors = <String, Map<String, Color>> {
  "fillColor": {
    "light": Colors.blue.shade300,
    "dark": Colors.grey.shade400,
  },
};
