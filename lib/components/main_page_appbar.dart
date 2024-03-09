import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../provider/data_provider.dart';

import './clear_ticked_button.dart';
import './reorder_button.dart';

class MainPageAppBar extends StatelessWidget {
  const MainPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 10,
          ),
          child: const Text("列表"),
        ),
        Builder(
          builder: (context) {
            if (context.watch<DataProvider>().thingData.isEmpty) {
              return const Text("");
            }

            return const Row(
              children: [
                ReorderButton(),
                ClearTickedButton(),
              ],
            );
          },
        ),
      ],
    );
  }
}
