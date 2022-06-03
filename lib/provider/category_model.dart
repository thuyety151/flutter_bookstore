import 'package:flutter/cupertino.dart';
import 'package:flutter_folder/models/category.dart';
import 'package:flutter_folder/services/category_api.dart';

class CategoryModel extends ChangeNotifier {
  final CategoryApi _api = CategoryApi();

  late List<Category> categoryHomescreen = [];
  late List<Category> options = [];

  Future<void> getCategoriesHomescreen() async {
    var response =  await _api.getTopCategory();
    categoryHomescreen = response.data as List<Category>;
    notifyListeners();
  }

  Future<void> getAll() async {
    var response = await _api.getAllCategory();
    options = response.data as List<Category>;
    notifyListeners();
  }
}
