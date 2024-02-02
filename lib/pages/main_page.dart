import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../provider/data_provider.dart';

import '../components/things_list.dart';
import '../components/things_add_button.dart';
import '../components/clear_ticked_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "列表",
            ),
            ClearTickedButton(),
          ]
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
    // Builder(
    //   builder: (context) {
    //     if (context.watch<DataProvider>().thingData.isEmpty) {
    //       return const Text("");
    //     }

    //     return Positioned(
    //       child: const ClearTickedButton(),
    //     );
    //   }
    // ),
  }
}
