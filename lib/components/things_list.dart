import 'package:flutter/material.dart';
import './things_card.dart';
import '../handle_things.dart' show ThingData;

class ThingsList extends StatelessWidget {
  ThingsList(ThingData list, {super.key})
  : date = list.date, things = list.things;

  final String date;
  final Map<String, bool> things;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var cardList = things.entries.map((thing) => ThingsCard(
        thing: thing.key,
        haveBeenCheck: thing.value,
    )).toList();

    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
            left: 0.05 * screenWidth,
            top: 10,
          ),
          child: Text(
            date,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.left,
          ),
        ), ...cardList,
      ],
    );
  }
}
