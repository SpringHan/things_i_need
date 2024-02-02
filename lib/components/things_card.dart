import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../provider/data_provider.dart';

import '../theme/theme.dart';

class ThingsCard extends StatefulWidget {
  const ThingsCard({
      super.key,
      required this.thing,
      required this.haveBeenCheck,
      required int cardId,
  }) : _cardId = cardId;

  final String thing;
  final bool haveBeenCheck;
  final int _cardId;

  @override
  State<ThingsCard> createState() => _ThingsCardState();
}

class _ThingsCardState extends State<ThingsCard> {
  bool? isChecked;

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    isChecked = isChecked ?? widget.haveBeenCheck;

    return Container(
      width: deviceWidth * 0.94,
      height: 72,
      margin: const EdgeInsets.only(
        bottom: 15,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow,
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 20,
          right: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                widget.thing,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Transform.scale(
              scale: 1.25,
              child: Checkbox(
                value: isChecked,
                activeColor: checkBoxColors.fetch(
                  item: "fillColor",
                  brightness: Theme.of(context).brightness.name,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                onChanged: (bool? newState) async {
                  context.read<DataProvider>().tickOrUntick(
                    listId: widget._cardId,
                    thingName: widget.thing,
                    newValue: newState!
                  );

                  if (mounted) {
                    setState(() {
                        isChecked = newState;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final checkBoxColors = <String, Map<String, Color>> {
  "fillColor": {
    "light": Colors.blue.shade300,
    "dark": Colors.grey.shade400,
  },
};
