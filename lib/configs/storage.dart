import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  List<String>? keywords = [];

  Storage();

  static const storage = FlutterSecureStorage();

  Future<List<String>> get getKeywords async {
    var data = await storage.read(key: "keywords");
    if (data != null) {
      keywords = (json.decode(data) as List<dynamic>)
          .map((e) => e.toString())
          .toList();
    }

    return keywords ?? [];
  }

  void setKeywords(String input) {
    keywords!.add(input);
    storage.write(key: "keywords", value: json.encode(keywords));
  }

  void removeKeyword(String? keyword) {
    if (keyword == null) {
      storage.delete(key: "keywords");
    } else {
      keywords = keywords!.where((element) => element != keyword).toList();
      storage.write(key: "keywords", value: json.encode(keywords));
    }
  }
}
