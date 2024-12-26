import 'package:flutter/material.dart';


class EditChildPage extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController ageController;
  final TextEditingController timeController;
  final TextEditingController timePassedController;
  final VoidCallback onSaveChild;

  const EditChildPage({
    super.key,
    required this.nameController,
    required this.ageController,
    required this.timeController,
    required this.timePassedController,
    required this.onSaveChild,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ویرایش اطلاعات کودک"),
          ],
        ), // Title passed dynamically.
      ),
      body: Container(
        decoration: const BoxDecoration(
          // Gradient background.
          gradient: LinearGradient(
            colors: [Colors.pinkAccent, Colors.orangeAccent],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'ویرایش اطلاعات ',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'نام',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'سن',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  controller: timeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'زمان باقی مانده (برحسب دقیقه)',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  controller: timePassedController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'زمان گذشته (برحسب دقیقه)',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: onSaveChild, // Save child callback.
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: const Text(
                    'ذخیره', // Static button text.
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
