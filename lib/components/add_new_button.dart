import 'package:flutter/material.dart';
import '../theme/theme.dart';

class AddNewButton extends StatelessWidget {
  const AddNewButton({
      super.key,
      required this.content,
      required this.onPressedFunc,
  });

  final String content;
  final void Function() onPressedFunc;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressedFunc,
      child: Text(
        content,
        style: TextStyle(
          color: buttonColors.fetch(
            item: "textColor",
            brightness: Theme.of(context).brightness.name
          ),
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
    );
  }
}

final buttonColors = <String, Map<String, Color>> {
  "textColor": {
    "light": Colors.black,
    "dark": Colors.white,
  },
};
