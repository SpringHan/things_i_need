import 'package:flutter/material.dart';

typedef ColorMap = Map<String, Map<String, Color>>;

extension FetchColorMap on ColorMap {
  Color fetch({required String item, required String brightness}) {
    return this[item]![brightness]!;
  }
}
