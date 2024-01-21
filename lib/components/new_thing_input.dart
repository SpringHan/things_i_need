import 'package:flutter/material.dart';

class NewThingInput extends StatefulWidget {
  const NewThingInput({
      super.key,
      this.inputInfo,
  });

  final String? inputInfo;

  @override
  State<NewThingInput> createState() => _NewThingInput();
}

class _NewThingInput extends State<NewThingInput> {
  late String input;

  bool _showIcon = false;
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: TextField(
        controller: _textController,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          suffixIcon: _showIcon
          ? IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _textController.clear();
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
      ),
    );
  }
}
