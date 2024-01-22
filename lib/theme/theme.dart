import 'package:flutter/material.dart';

typedef ColorsMap = Map<String, Map<String, Color>>;
typedef ColorMap = Map<String, Color>;

extension FetchColorMap on ColorMap {
  Color fetch(String brightness) {
    return this[brightness]!;
  }
}

extension FetchColorsMap on ColorsMap {
  Color fetch({required String item, required String brightness}) {
    return this[item]![brightness]!;
  }
}
