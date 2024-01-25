import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../provider/data_provider.dart';
import '../provider/widgets_provider.dart';

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
                  content: "取消",
                  onPressedFunc: () {
                    context.read<WidgetsProvider>().addPageChange();
                  },
                ),
              ),
            ),
            AddNewButton(
              content: "完成",
              onPressedFunc: () async {
                var widgetProvider = context.read<WidgetsProvider>();
                var dataProvider = context.read<DataProvider>();
                dataProvider.thingName = widgetProvider.textController.text;
                if (dataProvider.newThing.$1.isEmpty) {
                  widgetProvider.addPageChange();
                  return;
                }

                await dataProvider.addThing();
                widgetProvider.addPageChange();
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
  "light": Colors.white.withOpacity(0.7),
  "dark": Colors.black.withOpacity(0.3),
};
