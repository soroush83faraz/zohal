import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/theme.dart'; // Import your theme file
import 'view/homepage.dart'; // Import your homepage file
import 'theme_provider.dart'; // Create this file (see below)

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const KinderGartenApp(),
    ),
  );
}

class KinderGartenApp extends StatelessWidget {
  const KinderGartenApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kindergarten Time Manager',
      theme: themeProvider.isDarkMode ? darkTheme : lightTheme,
      home: const HomePage(),
    );
  }
}