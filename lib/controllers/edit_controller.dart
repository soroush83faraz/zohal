import 'package:flutter/material.dart';
import 'package:zohal/view/edit.dart';
import 'package:zohal/models/child.dart';

class EditController extends StatefulWidget {
  final Child? child;

  const EditController({super.key, this.child});
  @override
  _EditControllerState createState() => _EditControllerState();
}

class _EditControllerState extends State<EditController> {
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
    } else {}
  }

  void _saveChild() {
    if (_nameController.text.isNotEmpty &&
        _ageController.text.isNotEmpty &&
        _timeController.text.isNotEmpty) {
      if (int.parse(_timeController.text) -
              int.parse(_timePassedController.text) <=
          0) {
        const snackBar = SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
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
          timeLeft: int.parse(_timeController.text),
          totalReserved: int.parse(_timeController.text),
        );
        Navigator.pop(context, child);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return EditChildPage(
      nameController: _nameController,
      ageController: _ageController,
      timeController: _timeController,
      timePassedController: _timePassedController,
      onSaveChild: _saveChild,
    );
  }
}
