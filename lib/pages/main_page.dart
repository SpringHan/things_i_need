import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../components/data_provider.dart';

import '../components/things_list.dart';
import '../components/things_add_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: const Text("列表"),
        ),
      ),
      body: Builder(
        builder: (context) {
          var cardList = context.watch<DataProvider>().thingData;
          if (cardList.isEmpty) {
            return const Text("");
          }

          List<ThingsList> widgets = [];
          for (final card in cardList) {
            widgets.add(ThingsList(card));
          }
          return ListView(
            children: widgets,
          );
        },
      ),
      floatingActionButton: const ThingsAddButton(),
    );
  }
}
