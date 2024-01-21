import 'package:flutter/material.dart';
import '../components/new_thing_input.dart';
import '../components/date_switch.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPage();
}

class _AddPage extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: const Text("New Stuff"),
        ),
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
