import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_folder/helpers/error_handler.dart';
import 'package:flutter_folder/models/author.dart';

class AuthorModel extends ChangeNotifier {
  late List<Author> _authors = [];
  List<Author> get authors {
    return [..._authors];
  }

  Future<void> getListAuthor() async {
    var response = await withRestApiResponse(
        "/authors?pageSize=50&pageIndex=1&predicate=all");

    final List<Author> loadedItems = [];
    List<dynamic>? extractedData;
    extractedData = json.decode(response)["value"] as List<dynamic>;
    // ignore: unnecessary_null_comparison
    if (extractedData == null) {
      return;
    }

    // ignore: avoid_function_literals_in_foreach_calls
    extractedData.forEach((item) {
      loadedItems.add(Author.fromJson(item));
    });

    _authors = loadedItems.reversed.toList();
    notifyListeners();
  }
}
