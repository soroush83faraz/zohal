import 'package:flutter/material.dart';
import '../models/child.dart';

class ChildDetailPage extends StatelessWidget {
  final Child child;

  const ChildDetailPage({super.key, required this.child});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ Text(child.name)]), 
      ),
      body: Container(
        decoration: const BoxDecoration(
          // Gradient background.
          gradient: LinearGradient(
            colors: [Colors.yellow, Colors.orange],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "اسم: ${child.name}", // Display name.
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "سن: ${child.age}", // Display age.
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "زمان رزرو شده: ${child.totalReserved} دقیقه", // Total time.
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "زمان باقی مانده: ${child.timeLeft} دقیقه", // Remaining time.
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "زمان صرف شده: ${child.timePassed} دقیقه", // Time passed.
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
