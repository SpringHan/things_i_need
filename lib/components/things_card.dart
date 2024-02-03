import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../provider/data_provider.dart';
import '../provider/widgets_provider.dart';

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
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.haveBeenCheck;
  }

  @override
  void didUpdateWidget(ThingsCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    isChecked = widget.haveBeenCheck;
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

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
              child: GestureDetector(
                onTap: () {
                  var widgetProvider = context.read<WidgetsProvider>();

                  context.read<DataProvider>().modifyNewThing(
                    widget._cardId,
                    widget.thing
                  );
                  widgetProvider.textController.text = widget.thing;
                  widgetProvider.addPageChange();
                  widgetProvider.textFieldFocus.requestFocus();
                },
                child: Text(
                  widget.thing,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
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
