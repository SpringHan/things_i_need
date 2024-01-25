import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/widgets_provider.dart';
import '../theme/theme.dart';

class NewThingInput extends StatefulWidget {
  const NewThingInput({super.key});

  @override
  State<NewThingInput> createState() => _NewThingInput();
}

class _NewThingInput extends State<NewThingInput> {
  bool _showIcon = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: TextField(
        controller: context.watch<WidgetsProvider>().textController,
        style: const TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w500,
        ),
        cursorColor: inputColors.fetch(
          item: "unfocusedColor",
          brightness: Theme.of(context).brightness.name,
        ),
        decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: inputColors.fetch(
                item: "unfocusedColor",
                brightness: Theme.of(context).brightness.name,
              ),
            )
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: inputColors.fetch(
                item: "focusedColor",
                brightness: Theme.of(context).brightness.name,
              ),
            ),
          ),
          suffixIcon: _showIcon
          ? IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              context.read<WidgetsProvider>().textController.clear();
              setState(() {
                  _showIcon = false;
              });
            },
          )
          : null,
        ),
        onChanged: (text) {
          setState(() {
              _showIcon = text.isNotEmpty;
          });
        },
        focusNode: context.watch<WidgetsProvider>().textFieldFocus,
      ),
    );
  }
}

final inputColors = <String, Map<String, Color>> {
  "unfocusedColor": {
    "light": Colors.black,
    "dark": Colors.white,
  },
  "focusedColor": {
    "light": Colors.grey.shade600,
    "dark": Colors.grey.shade500,
  },
};
