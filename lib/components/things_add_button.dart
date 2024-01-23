import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/data_provider.dart';
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
        context.read<DataProvider>().addPageChange();
        context.read<DataProvider>().newThingInit();
        context.read<DataProvider>().textFieldFocus.requestFocus();
        context.read<DataProvider>().textController.clear();
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
