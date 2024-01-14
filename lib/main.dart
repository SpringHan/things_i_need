import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'pages/mainPage.dart';
import 'theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String title = "Stuff List";

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightMode,
      dark: darkMode,
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        title: title,
        theme: theme,
        darkTheme: darkTheme,
        home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: const HomePage(),
        ),
      ),
    );
  }
}
