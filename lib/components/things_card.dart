import 'package:flutter/material.dart';

class ThingsCard extends StatelessWidget {
  const ThingsCard({
      super.key,
      required this.thing,
  });

  final String thing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: FractionallySizedBox(
        widthFactor: 0.9,
        heightFactor: 0.15,
        alignment: FractionalOffset.center,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 0),
            borderRadius: BorderRadius.circular(30),
            // boxShadow: [
            //   BoxShadow(
            //   ),
            // ],
          ),
          child: Row(
            children: [
              Text(thing),
            ],
          ),
        ),
      ),
    );
  }
}
