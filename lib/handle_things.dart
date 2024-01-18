import 'package:path_provider/path_provider.dart';
import 'dart:io';

base class ThingData {
  ThingData({
      required this.name,
      required this.date,
      required this.checked,
  });

  final String? name;
  final DateTime? date;
  final bool? checked;
}

// Future<List<ThingData>> initThingData() async {
//   final cacheDirectory = await getApplicationCacheDirectory();

//   // var cacheFile = File("${cacheDirectory.path}")
// }

Future<Directory> initThingData() async {
  final cacheDirectory = await getApplicationCacheDirectory();

  // var cacheFile = File("${cacheDirectory.path}")
  return cacheDirectory;
}
