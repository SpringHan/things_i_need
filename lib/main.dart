import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import './pages/page_stack.dart';

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
        home: PageStack(),
      ),
    );
  }
}

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade200,
    primary: Colors.white,
    secondary: Colors.grey.shade100,
    shadow: Colors.grey.withOpacity(0.5),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade700,
    secondary: Colors.grey.shade800,
    shadow: Colors.grey.shade900,
  ),
);
