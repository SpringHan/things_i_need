import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/data_provider.dart';
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
    // Debug
    // toTopDistance = 0;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataProvider()),
      ],
      builder: (context, child) {
        return Stack(
          fit: StackFit.loose,
          alignment: Alignment.center,
          children: [
            MainPage(),
            Positioned.fill(
              top: context.watch<DataProvider>().usingAddPage
              ? 0
              : toTopDistance,
              child: AddPage()
            ),
          ],
        );
      },
    );
  }
}
