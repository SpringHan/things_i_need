import 'package:flutter/material.dart';
import '../components/things_list.dart';
import '../components/things_add_button.dart';
import 'dart:io';
import '../handle_things.dart';

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
          Text("a"),
          // FutureBuilder(
          //   future: initThingData(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       var files = snapshot.data!;

          //       return Text("a");
          //       // return ThingsList(
          //       //   thingsFor: "Today",
          //       //   things: {
          //       //   },
          //       // );
          //     } else {
          //       return const Text("Empty");
          //     }
          //   },
          // ),
        ],
      ),
      floatingActionButton: ThingsAddButton(),
    );
  }
}
