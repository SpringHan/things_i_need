import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../provider/data_provider.dart';
import '../provider/widgets_provider.dart';

import '../theme/theme.dart';

class ThingsAddButton extends StatelessWidget {
  const ThingsAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      foregroundColor: floatingButtonColors.fetch(
        item: "foregroundColor",
        brightness: Theme.of(context).brightness.name,
      ),
      backgroundColor: floatingButtonColors.fetch(
        item: "backgroundColor",
        brightness: Theme.of(context).brightness.name,
      ),
      onPressed: () {
        // To use previous date.
        context.read<DataProvider>().thingName = "";

        var widgetProvider = context.read<WidgetsProvider>();
        widgetProvider.addPageChange();
        widgetProvider.textFieldFocus.requestFocus();
        widgetProvider.textController.clear();
      },
      child: const Icon(Icons.add),
    );
  }
}

final floatingButtonColors = <String, Map<String, Color>> {
  "backgroundColor": {
    "light": Colors.blue.shade400,
    "dark": Colors.blue.shade900,
  },
  "foregroundColor": {
    "light": Colors.white,
    "dark": Colors.black,
  },
};
