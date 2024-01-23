import 'package:flutter/material.dart';
import '../components/things_list.dart';
import '../components/things_add_button.dart';
import '../handle_things.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    var thingsList = fetchThingData();

    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: const Text("Stuff List"),
        ),
      ),
      body: FutureBuilder(
        future: thingsList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ThingsList> cardList = [];
            for (final thing in snapshot.data!) {
              cardList.add(ThingsList(thing));
            }

            return ListView(
              children: cardList,
            );
          }

          return ListView(
            children: const [
              Text(""),
            ],
          );
        },
      ),
      floatingActionButton: ThingsAddButton(),
    );
  }
}
