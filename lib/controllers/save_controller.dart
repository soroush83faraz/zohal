import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:zohal/models/child.dart';

class SaveController {
  Future<String> _getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    final dataDir = Directory('${directory.path}/data');
    if (!await dataDir.exists()) {
      await dataDir.create();
    }
    return '${dataDir.path}/children.json';
  }

  Future<void> saveChildrenData(List<Child> children) async {
    final filePath = await _getFilePath();
    final file = File(filePath);

    List<Map<String, dynamic>> jsonChildren =
        children.map((child) => child.toJson()).toList();

    String jsonString = jsonEncode(jsonChildren);
    await file.writeAsString(jsonString);
  }
}

