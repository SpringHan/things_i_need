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

  Future<void> addThing() async {
    final formatedDate = DateFormat("yyyy/MM/dd").format(newThing.$2);
    final (insertIdx, insertWay) = ThingData.newInsertIdx(
      thingData,
      formatedDate
    );

    if (insertWay == ThingInsertCase.oldInsert) {
      thingData[insertIdx].things[newThing.$1] = false;
    } else {
      thingData.insert(insertIdx, ThingData(formatedDate, {
            newThing.$1: false
      }));
    }

    await storeThings(thingData);
    notifyListeners();
  }

  Future<void> removeTicked() async {
    List<ThingData> newList = [];

    for (var thing in thingData) {
      thing.removeTickedItems();
      newList.add(thing);
    }
    thingData = newList;

    await storeThings(thingData);
    notifyListeners();
  }

  Future<void> fetchStoredThings() async {
    thingData = await fetchThingData();
    notifyListeners();
  }

  set thingName(String name) => newThing = (name, newThing.$2);

  void newThingInit() {
    newThing = ("", newThing.$2);
    notifyListeners();
  }

  void newDate(DateTime newDate) {
    newThing = (newThing.$1, newDate);
    notifyListeners();
  }
}
