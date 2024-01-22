import 'package:flutter/material.dart';
import '../handle_things.dart' show ThingData;

class DataProvider extends InheritedWidget {
  DataProvider({
      super.key,
      required super.child,
      this.usingAddPage = false,
      this.thingData = const [],
  });

  bool usingAddPage;
  List<ThingData> thingData;
}
