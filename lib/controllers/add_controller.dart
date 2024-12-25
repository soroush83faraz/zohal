import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  late String _picture;
  
  @override
  void initState() {
    super.initState();
    if (widget.child != null) {
      _nameController.text = widget.child!.name;
      _ageController.text = widget.child!.age.toString();
      _timeController.text = widget.child!.totalReserved.toString();
      _timePassedController.text = widget.child!.timePassed.toString();
      _picture = widget.child!.picture;
    } else {
      _picture = "assets/default.png";
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _picture = image.path;
      });
    }
  }

  void _saveChild() {
    if (_nameController.text.isNotEmpty &&
        _ageController.text.isNotEmpty &&
        _timeController.text.isNotEmpty) {
      final child = Child(
        name: _nameController.text,
        age: int.parse(_ageController.text),
        picture: _picture,
        timeLeft: int.parse(_timeController.text),
        totalReserved: int.parse(_timeController.text),
        timePassed: int.parse(_timePassedController.text),
      );
      Navigator.pop(context, child); // Return the child object.
    }
  }

  @override
  Widget build(BuildContext context) {
    return AddChildPage(
      nameController: _nameController,
      ageController: _ageController,
      timeController: _timeController,
      timePassedController: _timePassedController,
      picture: _picture,
      onPickImage: _pickImage,
      onSaveChild: _saveChild,
    );
  }
}
