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
    var date = context.watch<DataProvider>().initDate;

    return SizedBox(
      height: 280,
      child: CupertinoDatePicker(
        key: ValueKey<DateTime>(date),
        itemExtent: 45,
        initialDateTime: date,
        onDateTimeChanged: (DateTime newDate) {
          context.read<DataProvider>().newDate = newDate;
        },
        mode: CupertinoDatePickerMode.date,
      ),
    );
  }
}
