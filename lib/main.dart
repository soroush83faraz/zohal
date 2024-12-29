import 'package:flutter/material.dart';
import 'view/homepage.dart';

void main() {
  runApp(const KinderGartenApp());
}

class KinderGartenApp extends StatelessWidget {
  const KinderGartenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kindergarten Time Manager', 
      home: HomePage(), 
    );
  }
}