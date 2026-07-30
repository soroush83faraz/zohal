import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';
import 'package:zohal/models/child.dart';

/// WEB DEMO CHANGE: `path_provider` and `dart:io` file access have no
/// implementation on Flutter web, so the original JSON-file persistence would
/// crash the live demo at runtime. On web the app falls back to this shared
/// in-memory store instead (state lasts until the browser tab is reloaded).
/// Native platforms (Windows/Android/...) still use the JSON file as before.
class InMemoryChildrenStore {
  static String childrenJson = '[]';
}

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
    // WEB DEMO CHANGE: read from the in-memory store on web (see above).
    if (kIsWeb) {
      List<dynamic> jsonList = jsonDecode(InMemoryChildrenStore.childrenJson);
      return jsonList.map((json) => Child.fromJson(json)).toList();
    }
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
    // WEB DEMO CHANGE: clear the in-memory store on web (see above).
    if (kIsWeb) {
      InMemoryChildrenStore.childrenJson = '[]';
      return;
    }
    final filePath = await _getFilePath();
    final file = File(filePath);
    if (await file.exists()) {
      await file.writeAsString('[]');
    }
  }
}
