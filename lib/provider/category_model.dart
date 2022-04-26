import 'package:flutter/cupertino.dart';
import 'package:flutter_folder/models/category.dart';
import 'package:flutter_folder/services/category_api.dart';

class CategoryModel extends ChangeNotifier {
  final CategoryApi _api = CategoryApi();

  late List<Category> categoryHomescreen = [];

  Future<void> getCategoriesHomescreen() async {
    var response = await _api.getTopCategory();
    categoryHomescreen = response.data as List<Category>;
    notifyListeners();
  }
}
