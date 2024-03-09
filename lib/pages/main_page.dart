import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../provider/data_provider.dart';
import '../provider/widgets_provider.dart';

import '../components/things_list.dart';
import '../components/things_add_button.dart';
import '../components/reorder_button.dart';
import '../components/main_page_appbar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const MainPageAppBar(),
      ),
      body: Builder(
        builder: (context) {
          final cardList = context.watch<DataProvider>().thingData;
          if (cardList.isEmpty) {
            return const Text("");
          }
          
          List<ThingsList> widgets = [];
          for (var i = 0; i < cardList.length; i++) {
            widgets.add(ThingsList(cardList[i], i));
          }
          return ListView(
            controller: context.read<WidgetsProvider>().listViewController,
            children: widgets,
          );
        },
      ),
      floatingActionButton: Builder(
        builder: (context) {
          // When the ListView is on top, show floating button.
          final onTop = context.watch<WidgetsProvider>().onTop;
          if (onTop) {
            return const ThingsAddButton();
          }
          return const Text("");
        }
      ),
    );
  }
}
