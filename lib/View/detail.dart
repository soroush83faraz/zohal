import 'package:flutter/material.dart';
import '../models/child.dart';

class ChildDetailPage extends StatelessWidget {
  final Child child;

  const ChildDetailPage({super.key, required this.child});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(child.name), 
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(child.picture), // Display child's picture.
                ),
                const SizedBox(height: 20),
                Text(
                  "Name: ${child.name}", // Display name.
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  "Age: ${child.age}", // Display age.
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  "Time Reserved: ${child.totalReserved} min", // Total time.
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  "Time Left: ${child.timeLeft} min", // Remaining time.
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  "Time Passed: ${child.timePassed} min", // Time passed.
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
