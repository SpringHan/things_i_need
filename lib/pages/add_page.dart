import 'package:flutter/material.dart';
import '../components/new_thing_input.dart';
import '../components/date_switch.dart';
import '../theme/theme.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPage();
}

class _AddPage extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackgroundColor.fetch(
        Theme.of(context).brightness.name
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NewThingInput(),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            child: DateSwitch(),
          ),
        ],
      ),
    );
  }
}

final pageBackgroundColor = <String, Color> {
  "light": Colors.white.withOpacity(0.4),
  "dark": Colors.black.withOpacity(0.3),
};
