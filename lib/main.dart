import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'pages/main_page.dart';
import 'theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightMode,
      dark: darkMode,
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Stuff List",
        theme: theme,
        darkTheme: darkTheme,
        home: HomePage(),
      ),
    );
  }
}
