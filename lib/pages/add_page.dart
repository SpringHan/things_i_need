import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../components/data_provider.dart';

import '../components/new_thing_input.dart';
import '../components/date_switch.dart';
import '../components/add_new_button.dart';

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
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: AddNewButton(
                  content: "Cancel",
                  onPressedFunc: () {
                    context.read<DataProvider>().addPageChange();
                  },
                ),
              ),
            ),
            AddNewButton(
              content: "Finish",
              onPressedFunc: () async {
                var provider = context.read<DataProvider>();
                provider.addPageChange();
                if (provider.newThing.$1.isEmpty) {
                  return;
                }

                await provider.addThing(provider.newThing);
                provider.addPageChange();
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const NewThingInput(),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            child: const DateSwitch(),
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
