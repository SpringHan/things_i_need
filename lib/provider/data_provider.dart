import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import '../handle_things.dart';

class DataProvider extends ChangeNotifier {
  DataProvider() {
    fetchStoredThings();
  }

  List<ThingData> thingData = [];

  //The data for add_page
  (String, DateTime) newThing = ("", DateTime.now());
  DateTime initDate = DateTime.now();

  // Edit mode
  ThingEditMode editMode = ThingEditMode.init();

  Future<void> addThing({bool checked = false}) async {
    final formattedDate = DateFormat("yyyy/MM/dd").format(newThing.$2);
    final (insertIdx, insertWay) = ThingData.newInsertIdx(
      thingData,
      formattedDate
    );

    if (insertWay == ThingInsertCase.oldInsert) {
      thingData[insertIdx].things[newThing.$1] = checked;
    } else {
      thingData.insert(insertIdx, ThingData(formattedDate, {
            newThing.$1: checked
      }));
    }

    await storeThings(thingData);
    notifyListeners();
  }

  /// Remove all the empty things defaultly.
  /// When removeTicked is true, do it in the meanwhile.
  Future<void> formatAllThings({bool removeTicked = false}) async {
    List<ThingData> newList = [];

    for (var thing in thingData) {
      if (removeTicked) thing.removeTickedItems();

      if (thing.things.isNotEmpty) {
        newList.add(thing);
      }
    }
    thingData = newList;

    await storeThings(thingData);
    notifyListeners();
  }

  Future<void> fetchStoredThings() async {
    thingData = await fetchThingData();
    notifyListeners();
  }

  // NOTE: To improve performance, the notifying function is not called. 
  Future<void> tickOrUntick({
      required int listId,
      required bool newValue,
      required String thingName
  }) async {
    thingData[listId].things[thingName] = newValue;
    await storeThings(thingData);
  }

  set thingName(String name) => newThing = (name, newThing.$2);
  set newDate(DateTime newDate) => newThing = (newThing.$1, newDate);
  
  void newThingInit() {
    newThing = ("", DateTime.now());
    notifyListeners();
  }

  /// Change `newThing` to modify an existed thing.
  /// Set properties of add_page in the meanwhile.
  void modifyNewThing(int listId, String thingName) {
    final thingDate0 = thingData[listId].date;
    final thingDate = DateTime.parse(
      thingDate0.replaceAll("/", "-")
    );
    final thingIdx = _getThingIdx(listId, thingName);

    newThing = (thingName, thingDate);
    editMode = ThingEditMode(
      modifyMode: true,
      listIdx: listId,
      cardIdx: thingIdx,
      prevName: thingName
    );
    initDate = thingDate;
    notifyListeners();
  }

  int _getThingIdx(int listId, String thingName) {
    final keysEntry = thingData[listId].things.keys;
    var i = 0;
    for (final name in keysEntry) {
      if (name == thingName) return i;
      i++;
    }
    throw FlutterError("Cannot get the target thing!");
  }

  /// Modify an existed thing.
  Future<void> modifyThing() async {
    final targetMap = thingData[editMode.listIdx!].things;
    final checked = targetMap[editMode.prevName!]!;
    targetMap.remove(editMode.prevName!);

    if (initDate.compareTo(newThing.$2) == 0) {
      final targetList = targetMap.entries.toList();
      targetList.insert(editMode.cardIdx!, MapEntry(
          newThing.$1,
          checked
      ));
      thingData[editMode.listIdx!].things = Map.fromEntries(targetList);
      await storeThings(thingData);
      notifyListeners();
      return;
    }

    if (targetMap.isEmpty) {
      thingData.removeAt(editMode.listIdx!);
    }
    await addThing(checked: checked);
    // notifyListeners ... functions have been called in addThing.
  }

  void quitModifyMode() {
    newThing = ("", DateTime.now());
    initDate = newThing.$2;
    editMode = ThingEditMode.init();
  }
}

class ThingEditMode {
  ThingEditMode({
      required this.modifyMode,
      required this.listIdx,
      required this.cardIdx,
      required this.prevName,
  });

  ThingEditMode.init()
  : modifyMode = false,
  listIdx = null,
  cardIdx = null,
  prevName = null;

  final bool modifyMode;
  final int? listIdx;
  final int? cardIdx;
  final String? prevName;
}
