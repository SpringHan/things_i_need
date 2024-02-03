import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/data_provider.dart';

class ClearTickedButton extends StatelessWidget {
  const ClearTickedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.25,
      child: IconButton(
        icon: const Icon(Icons.delete_outline),
        onPressed: () async {
          await context.read<DataProvider>().formatAllThings(
            removeTicked: true
          );
        },
      ),
    );
  }
}
