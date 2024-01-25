import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../provider/data_provider.dart';

class DateSwitch extends StatefulWidget {
  const DateSwitch({super.key});

  @override
  State<DateSwitch> createState() => _DateSwitch();
}

class _DateSwitch extends State<DateSwitch> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: CupertinoDatePicker(
        itemExtent: 45,
        initialDateTime: context.watch<DataProvider>().newThing.$2,
        onDateTimeChanged: (DateTime newDate) {
          context.read<DataProvider>().newDate(newDate);
        },
        mode: CupertinoDatePickerMode.date,
      ),
    );
  }
}
