import 'package:flutter/material.dart';
import './things_card.dart';

class ThingsList extends StatelessWidget {
  const ThingsList({
      super.key,
      required this.thingsFor,
      required this.things,
  });

  final String thingsFor;
  final List<String> things;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: things.length,
      itemBuilder: (context, idx) {
        return Align(
          alignment: Alignment.center,
          child: ThingsCard(thing: things[idx]),
        );
      },
    );
  }
}
