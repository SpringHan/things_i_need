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

  void removeTickedItems() {
    things = Map.fromEntries(things.entries.where((i) => !i.value));
  }

  static (int, ThingInsertCase) newInsertIdx(
    List<ThingData> data,
    String date
  ) {
    if (data.isEmpty) return (0, ThingInsertCase.newInsert);

    for (var i = 0; i < data.length; i++) {
      switch (date.compareDate(data[i].date)) {
        case 0:
        return (i, ThingInsertCase.oldInsert);
        case -1:
        return (i, ThingInsertCase.newInsert);
      }
    }

    return (data.length, ThingInsertCase.newInsert);
  }
}

extension DateCompare on String {
  int compareDate(String another) {
    final originList = split("/");
    final anotherList = another.split("/");

    for (var i = 0; i < 3; i++) {
      final result = originList[i]._innerCompare(anotherList[i]);
      if (result != 0) {
        return result;
      }
    }

    return 0;
  }

  int _innerCompare(String another) {
    return int.parse(this).compareTo(int.parse(another));
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
    Map<String, bool> tempThings = {};
    for (final thing in thingWithDate.value.entries) {
      tempThings[thing.key] = thing.value;
    }

    finalData.add(ThingData(
        thingWithDate.key,
        tempThings
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

Future<List<ThingData>> reorderThings(List<ThingData> things) async {
  final List<ThingData> newThings = [];

  for (final thingList in things) {
    final ticked = <String, bool> {};
    final unTicked = <String, bool> {};

    for (final thing in thingList.things.entries) {
      if (thing.value) {
        ticked[thing.key] = true;
      } else {
        unTicked[thing.key] = false;
      }
    }

    ticked.addEntries(unTicked.entries);
    newThings.add(ThingData(thingList.date, ticked));
  }

  return newThings;
}
