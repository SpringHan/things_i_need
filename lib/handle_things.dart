import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async' show FutureOr;
import 'dart:convert' show jsonDecode, jsonEncode;

enum ThingInsertCase {
  oldInsert,
  newInsert,
}

base class ThingData {
  ThingData(this.date, this.things);

  final String date;
  Map<String, bool> things;

  int compare(DateTime newDate) {
    return newDate.compareTo(DateTime.parse(date));
  }

  void removeTickedItems() {
    things = Map.fromEntries(things.entries.where((i) => !i.value));
  }

  static (int, ThingInsertCase) newInsertIdx(
    List<ThingData> data,
    DateTime date
  ) {
    for (var i = 0; i < data.length; i++) {
      switch (data[i].compare(date)) {
        case 0:
        return (i, ThingInsertCase.oldInsert);
        case -1:
        return (i == 0 ? 0 : i - 1, ThingInsertCase.newInsert);
      }
    }

    return (data.length, ThingInsertCase.newInsert);
  }
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
