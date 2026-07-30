import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';
import 'package:zohal/controllers/load_controller.dart'
    show InMemoryChildrenStore;
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
    List<Map<String, dynamic>> jsonChildren =
        children.map((child) => child.toJson()).toList();

    String jsonString = jsonEncode(jsonChildren);

    // WEB DEMO CHANGE: `path_provider`/`dart:io` are unavailable on Flutter
    // web; keep the demo alive by writing to the shared in-memory store
    // (see load_controller.dart) instead of a JSON file.
    if (kIsWeb) {
      InMemoryChildrenStore.childrenJson = jsonString;
      return;
    }

    final filePath = await _getFilePath();
    final file = File(filePath);
    await file.writeAsString(jsonString);
  }
}

