import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_folder/helpers/error_handler.dart';
import 'package:flutter_folder/models/book.dart';
import 'package:flutter_folder/models/filter.dart';
import 'package:flutter_folder/models/newrelease.dart';
import 'package:flutter_folder/models/review.dart';
import 'package:flutter_folder/services/book_api.dart';

class BookModel extends ChangeNotifier {
  final BookApi _api = BookApi();

  List<Book> listBestSelling = [];
  List<NewReleaseModel> listNewRelease = [];
  List<Book> listDeal = [];
  Book? detail;
  late Filter filterData = Filter.empty();

  void getListBestSelling() async {
    var response = await _api.bestSelling();
    listBestSelling = response.data as List<Book>;
    notifyListeners();
  }

  void getListNewRelease() async {
    var response = await _api.getListNewrelease();
    listNewRelease = response.data as List<NewReleaseModel>;
    notifyListeners();
  }

  void getListBookForSale(String predicate) async {
    var response = await _api.getBookForSales(predicate);
    listDeal = response.data as List<Book>;
    notifyListeners();
  }

  Future<void> getDetail(String id) async {
    if (detail?.id == id) {
      return;
    }
    var response = await _api.getBookDetail(id);
    detail = response;
    getListReviews(id);
    notifyListeners();
  }

  void setFilterData(Filter data) {
    filterData = data;
    notifyListeners();
  }

  void clearFilterData() {
    filterData = Filter.empty();
    notifyListeners();
  }

  Future<void> getListReviews(String id) async {
    try {
      var res = await withRestApiResponse("/reviews?bookId=$id");
      var value = json.decode(res)["value"] as List<dynamic>;
      detail?.reviews = value.map((e) => Review.fromJson(e)).toList();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
