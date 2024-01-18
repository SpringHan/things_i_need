import 'package:flutter/material.dart';
import '../components/things_list.dart';
import '../components/things_add_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: const Text("Stuff List"),
        ),
      ),
      body: ListView(
        children: const [
          ThingsList(
            thingsFor: "Test",
            things: {
              "Width": false,
              "Others": true,
            },
          ),
        ],
      ),
      floatingActionButton: ThingsAddButton(),
    );
  }
}
