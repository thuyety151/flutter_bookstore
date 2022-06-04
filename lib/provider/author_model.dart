import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_folder/helpers/error_handler.dart';
import 'package:flutter_folder/models/author.dart';
import 'package:http/http.dart' as http;
import '../models/constants.dart';

class AuthorModel extends ChangeNotifier {
  late List<Author> _authors = [];
  List<Author> get authors {
    return [..._authors];
  }

  Future<void> getListAuthor() async {
    // final url = Uri.parse(
    //     apiEndpoint + '/authors?pageSize=50&pageIndex=1&predicate=all');
    // final response = await http.get(url, headers: {
    //   'Content-Type': 'application/json',
    //   'Accept': 'application/json',
    // });

    var response = await withRestApiResponse(
        "/authors?pageSize=50&pageIndex=1&predicate=all");

    final List<Author> loadedItems = [];
    List<dynamic>? extractedData;
    extractedData = json.decode(response)["value"] as List<dynamic>;
    // ignore: unnecessary_null_comparison
    if (extractedData == null) {
      return;
    }

    extractedData.forEach((item) {
      loadedItems.add(Author.fromJson(item));
    });

    _authors = loadedItems.reversed.toList();
    notifyListeners();
  }
}
