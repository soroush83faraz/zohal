import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:zohal/models/child.dart';

class LoadController {
  Future<String> _getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    final dataDir = Directory('${directory.path}/data');
    if (!await dataDir.exists()) {
      await dataDir.create();
    }
    return '${dataDir.path}/children.json';
  }

  Future<List<Child>> loadChildrenData() async {
    final filePath = await _getFilePath();
    final file = File(filePath);
    if (await file.exists()) {
      String jsonString = await file.readAsString();
      List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((json) => Child.fromJson(json)).toList();
    } else {
      return [];
    }
  }
  Future<void> clearDatabase() async {
    final filePath = await _getFilePath();
    final file = File(filePath);
    if (await file.exists()) {
      await file.writeAsString('[]');
    }
  }
}
