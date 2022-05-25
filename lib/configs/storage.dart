import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  List<String>? keywords;

  static const storage = FlutterSecureStorage();

  Future<List<String>?> get getKeywords async {
    var data = await storage.read(key: "keywords");
    keywords = json.decode(data ?? "");
    return keywords;
  }
}
