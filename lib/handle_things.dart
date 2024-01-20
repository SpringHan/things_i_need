import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async' show FutureOr;
import 'dart:convert' show jsonDecode, jsonEncode;

base class ThingData {
  ThingData(this.date, this.things);

  final String date;
  final Map<String, bool> things;
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

  List<ThingData> finalData = [];
  Map<String, dynamic> thingsList = jsonDecode(fileContent);
  for (final thingWithDate in thingsList.entries) {
    finalData.add(ThingData(
        thingWithDate.key,
        thingWithDate.value,
    ));
  }

  return finalData;
}

Future<void> storeThings(FutureOr<List<ThingData>> thingList) async {
  final storageDirectory = await getExternalStorageDirectory();
  var listFile = File("${storageDirectory!.path}/thingsList.json");
  if (!(await listFile.exists())) {
    listFile = await listFile.create();
  }

  Map<String, dynamic> originData = {};
  for (final thing in await thingList) {
    originData[thing.date] = thing.things;
  }

  final fileContent = jsonEncode(originData);
  await listFile.writeAsString(fileContent);
}
