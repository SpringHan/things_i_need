import 'package:flutter/material.dart';
import 'package:scroll_datetime_picker/scroll_datetime_picker.dart';
import 'package:intl/intl.dart';

class DateSwitch extends StatefulWidget {
  const DateSwitch({super.key});

  @override
  State<DateSwitch> createState() => _DateSwitch();
}

class _DateSwitch extends State<DateSwitch> {
  final currentDate = DateTime.now();
  late DateTime date;

  @override
  Widget build(BuildContext context) {
    date = currentDate;

    return ScrollDateTimePicker(
      itemExtent: 54,
      infiniteScroll: true,
      dateOption: DateTimePickerOption(
        dateFormat: DateFormat("yyyyMMdd"),
        minDate: DateTime(currentDate.year, 1, 1),
        maxDate: DateTime(currentDate.year + 1, 12, 31),
        initialDate: currentDate,
      ),
      style: DateTimePickerStyle(
        centerDecoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      onChange: (newDate) {
        setState(() {
            date = newDate;
        });
      },
    );
  }
}

// final DateSwitchColors = <String, Map<String, Color>> {
//   "activeColor": {
//     "light": Colors.grey.shade300.withOpacity(0.5),
//     "dark": Colors.grey.shade700.withOpacity(0.5),
//   },
// };
