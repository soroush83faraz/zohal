import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.pinkAccent,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    color: Colors.pinkAccent,
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.grey,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    color: Colors.grey,
  ),
);

Decoration appBarLightDecoration = const BoxDecoration(
  gradient: LinearGradient(
    colors: [Colors.pinkAccent, Colors.orangeAccent],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  ),
);

Decoration homePageLightDecoration = const BoxDecoration(
  image: DecorationImage(image: AssetImage("images/winnie-the-pooh.png")),
  gradient: LinearGradient(
    colors: [Colors.purpleAccent, Colors.blueAccent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
);

Decoration appBarDarkDecoration = const BoxDecoration(
  gradient: LinearGradient(
    colors: [Color.fromARGB(255, 154, 2, 53), Colors.black],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  ),
);

Decoration homePageDarkDecoration = const BoxDecoration(
  image: DecorationImage(image: AssetImage("images/winnie-the-pooh.png")),
  gradient: LinearGradient(
    colors: [Colors.black, Color.fromARGB(255, 6, 76, 197)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
);