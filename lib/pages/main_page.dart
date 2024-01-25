import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../provider/data_provider.dart';
import '../provider/widgets_provider.dart';

import '../components/things_list.dart';
import '../components/things_add_button.dart';
import '../components/clear_ticked_button.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            key: context.read<WidgetsProvider>().appBarKey,
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
        ),
        Builder(
          builder: (context) {
            final height = context.watch<WidgetsProvider>().appBarHeight;

            if (
              // context.watch<DataProvider>().thingData.isEmpty
              // ||
              height == null) {
              return const Text("");
            }

            return Positioned(
              top: height * 0.5,
              child: const ClearTickedButton(),
            );
          },
        ),
      ]
    );
  }
}
