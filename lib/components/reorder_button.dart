import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../provider/data_provider.dart';

class ReorderButton extends StatelessWidget {
  const ReorderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await context.read<DataProvider>().reorderAction();
      },
      icon: Transform.scale(
        scale: 1.25,
        child: const Icon(
          Icons.autorenew_rounded
        ),
      ),
    );
  }
}
