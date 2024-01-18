import 'package:flutter/material.dart';
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
      },
      child: const Icon(Icons.add),
    );
  }
}
