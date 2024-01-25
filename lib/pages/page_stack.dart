import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../provider/data_provider.dart';
import '../provider/widgets_provider.dart';

import './main_page.dart';
import './add_page.dart';

class PageStack extends StatefulWidget {
  const PageStack({super.key});

  @override
  State<PageStack> createState() => _PageStack();
}

class _PageStack extends State<PageStack> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataProvider()),
        ChangeNotifierProvider(create: (_) => WidgetsProvider()),
      ],
      builder: (context, _) {
        return Stack(
          fit: StackFit.loose,
          alignment: Alignment.center,
          children: [
            const MainPage(),
            Positioned.fill(
              top: context.watch<WidgetsProvider>().usingAddPage
              ? 0
              : screenHeight,
              child: const AddPage()
            ),
          ],
        );
      },
    );
  }
}
