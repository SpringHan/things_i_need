import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert' show jsonDecode, jsonEncode;

base class ThingData {
  ThingData({
      required this.name,
      required this.date,
      required this.checked,
  });

  ThingData.fromJson(Map<String, dynamic> json)
  : name = json["name"]!,
  date = json["date"]!,
  checked = json["checked"];

  final String? name;
  final DateTime? date;
  final bool? checked;
}

Future<List<ThingData>> fetchThingData() async {
  final storageDirectory = await getExternalStorageDirectory();
  final listFile = File("${storageDirectory!.path}/thingsList.json");
  if (!(await listFile.exists())) {
    await listFile.create();
    return [];
  }

  final fileContent = await listFile.readAsString();

  if (fileContent.isEmpty) {
    return [];
  }

  List<Map<String, dynamic>> thingsList = jsonDecode(fileContent);
  var finalList = thingsList.fold(<ThingData>[], (acc, item) {
      acc.add(ThingData.fromJson(item));
      return acc;
  });

  return finalList;
}

Future<void> storeThings(List<Map<String, dynamic>> thingList) async {
  final storageDirectory = await getExternalStorageDirectory();
  var listFile = File("${storageDirectory!.path}/thingsList.json");
  if (!(await listFile.exists())) {
    listFile = await listFile.create();
  }

  final fileContent = jsonEncode(thingList);
  await listFile.writeAsString(fileContent);
}
