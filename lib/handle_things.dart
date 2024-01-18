import 'package:path_provider/path_provider.dart';
import 'dart:io';

base class ThingData {
  ThingData({
      required this.name,
      required this.date,
      required this.checked,
  });

  String? name;
  DateTime? date;
  bool? checked;
}
