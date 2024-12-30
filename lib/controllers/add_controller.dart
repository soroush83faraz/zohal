import 'package:flutter/material.dart';
import 'package:zohal/view/add.dart';
import 'package:zohal/models/child.dart';

class AddController extends StatefulWidget {
  final Child? child;

  const AddController({super.key, this.child});
  
  @override
  _AddControllerState createState() => _AddControllerState();
}

class _AddControllerState extends State<AddController> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _timeController = TextEditingController();
  final _timePassedController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.child != null) {
      _nameController.text = widget.child!.name;
      _ageController.text = widget.child!.age.toString();
      _timeController.text = widget.child!.totalReserved.toString();
      _timePassedController.text = (widget.child!.totalReserved - widget.child!.timeLeft).toString();
    }
  }

  void _saveChild() {
    if (_nameController.text.isNotEmpty &&
        _ageController.text.isNotEmpty &&
        _timeController.text.isNotEmpty &&
        _timePassedController.text.isNotEmpty) {
      int totalReserved = int.parse(_timeController.text);
      int timePassed = int.parse(_timePassedController.text);

      if (totalReserved - timePassed <= 0) {
        const snackBar = SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "زمان سپری شده نمی تواند بیشتر از زمان رزرو شده باشد",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        final child = Child(
          name: _nameController.text,
          age: int.parse(_ageController.text),
          totalReserved: totalReserved,
          timeLeft: totalReserved - timePassed,
          dateTimeReserved: DateTime.now().subtract(Duration(minutes: timePassed)), // Correctly set dateTimeReserved
        );
        Navigator.pop(context, child);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AddChildPage(
      nameController: _nameController,
      ageController: _ageController,
      timeController: _timeController,
      timePassedController: _timePassedController,
      onSaveChild: _saveChild,
    );
  }
}
