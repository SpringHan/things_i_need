import 'package:flutter/material.dart';
import './main_page.dart';
import './add_page.dart';

class PageStack extends StatefulWidget {
  const PageStack({super.key});

  @override
  State<PageStack> createState() => _PageStack();
}

class _PageStack extends State<PageStack> {
  late double toTopDistance;

  @override
  Widget build(BuildContext context) {
    toTopDistance = MediaQuery.of(context).size.height;

    return Stack(
      fit: StackFit.loose,
      alignment: Alignment.center,
      children: [
        MainPage(),
        Positioned.fill(
          top: toTopDistance,
          child: AddPage()
        ),
      ]
    );
  }
}
