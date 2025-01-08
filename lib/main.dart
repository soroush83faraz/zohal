import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme.dart';
import 'theme_notifier.dart';
import 'package:zohal/View/homepage.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return ThemeProvider(
      initTheme: themeNotifier.themeMode == ThemeMode.light ? lightTheme : darkTheme,
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeNotifier.themeMode,
          home: HomePage(),
        ),
      ),
    );
  }
}
