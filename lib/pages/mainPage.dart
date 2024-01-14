import 'package:flutter/material.dart';
import '../components/things_card.dart';
// import '../theme/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ThingsCard(thing: 'Make');
  }
}
