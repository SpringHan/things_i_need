import 'package:flutter/material.dart';
import '../components/things_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: ThingsList(
        thingsFor: "Test",
        things: ["Width", "Others"],
      ),
    );
  }
}
