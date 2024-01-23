import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/data_provider.dart';

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
        controller: context.watch<DataProvider>().textController,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          suffixIcon: _showIcon
          ? IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              context.read<DataProvider>().textController.clear();
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
        focusNode: context.watch<DataProvider>().textFieldFocus,
      ),
    );
  }
}
