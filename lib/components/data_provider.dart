import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import '../handle_things.dart';

class DataProvider extends ChangeNotifier {
  bool usingAddPage = false;
  List<ThingData> thingData = [];

  // Add Page
  FocusNode textFieldFocus = FocusNode();
  TextEditingController textController = TextEditingController();

  //The data for add_page
  (String, DateTime) newThing = ("", DateTime.now());

  void addPageChange() {
    usingAddPage = !usingAddPage;
    notifyListeners();
  }

  Future<void> addThing((String, DateTime) newThingData) async {
    final formatedDate = DateFormat("yyyy/MM/dd").format(newThingData.$2);
    final (insertIdx, insertWay) = ThingData.newInsertIdx(
      thingData,
      newThingData.$2
    );

    if (insertWay == ThingInsertCase.oldInsert) {
      thingData[insertIdx].things[newThingData.$1] = false;
    } else {
      thingData.insert(insertIdx, ThingData(formatedDate, {
            newThingData.$1: false
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

  void newThingInit() {
    newThing = ("", newThing.$2);
    notifyListeners();
  }

  void newDate(DateTime newDate) {
    newThing = (newThing.$1, newDate);
    notifyListeners();
  }

  void focusNodeDispose() {
    textFieldFocus.dispose();
  }
}
