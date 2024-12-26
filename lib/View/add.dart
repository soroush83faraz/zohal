import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddChildPage extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController ageController;
  final TextEditingController timeController;
  final TextEditingController timePassedController;
  final String picture;
  final VoidCallback onPickImage;
  final VoidCallback onSaveChild;

  const AddChildPage({
    super.key,
    required this.nameController,
    required this.ageController,
    required this.timeController,
    required this.timePassedController,
    required this.picture,
    required this.onPickImage,
    required this.onSaveChild,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text('اضافه کردن کودک'),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    "اطلاعات کودک را وارد کنید",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
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
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
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
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],

                  decoration: InputDecoration(
                    labelText: 'زمان گذشته شده (برحسب دقیقه)',
                    
                    
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
                  onPressed: onSaveChild,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: const Text(
                    'اضافه کردن کودک',
                    style: TextStyle(
                      fontSize: 20,
                    ),
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
