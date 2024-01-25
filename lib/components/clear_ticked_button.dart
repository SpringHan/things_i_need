import 'package:flutter/material.dart';

class ClearTickedButton extends StatelessWidget {
  const ClearTickedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.25,
      child: IconButton(
        icon: Icon(Icons.delete_outline),
        onPressed: () {
        },
      ),
    );
  }
}
