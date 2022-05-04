import 'package:flutter/foundation.dart';
import 'package:flutter_folder/models/author.dart';
import 'package:flutter_folder/services/author_api.dart';

class AuthorModel extends ChangeNotifier {
  final AuthorApi _api = AuthorApi();
  late List<Author> listAuthor;

  Future<void> getListAuthor() async {
    var response = await _api.getListAuthor();
    listAuthor = response.data as List<Author>;
    notifyListeners();
  }
}
