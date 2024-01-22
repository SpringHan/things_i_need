import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import '../handle_things.dart';

class DataProviderWidget extends StatefulWidget {
  const DataProviderWidget({
      super.key,
      required this.child,
  });

  final Widget child;

  @override
  State<DataProviderWidget> createState() => _DataProviderWidget();
}

class _DataProviderWidget extends State<DataProviderWidget> {
  bool usingAddPage = false;
  List<ThingData> thingData = [];

  void addPageChange(bool newVal) {
    setState(() {
        usingAddPage = !newVal;
    });
  }

  void addThing(DateTime date, String thing) {
    final formatedDate = DateFormat("yyyy/MM/dd").format(date);
    final (insertIdx, insertWay) = ThingData.newInsertIdx(thingData, date);

    setState(() {
        if (insertWay == ThingInsertCase.oldInsert) {
          thingData[insertIdx].things[thing] = false;
        } else {
          thingData.insert(insertIdx, ThingData(
              formatedDate,
              {thing: false}
          ));
        }
    });
  }
}

class DataProvider extends InheritedWidget {
  const DataProvider({
      super.key,
      required super.child,
      required this.usingAddPage,
      required this.thingData,
      required this.boolChangeFunc,
      required this.addFunction,
      required this.removeFunction,
  });

  final bool usingAddPage;
  final List<ThingData> thingData;
  final ValueChanged<bool> boolChangeFunc;
  final void Function(DateTime, String) addFunction;
  final ValueChanged<List<ThingData>> removeFunction;

  static DataProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType()! as DataProvider;
  }

  @override
  bool updateShouldNotify(DataProvider oldWidget) {
    return oldWidget.usingAddPage != usingAddPage
    || oldWidget.thingData != thingData;
  }
}
