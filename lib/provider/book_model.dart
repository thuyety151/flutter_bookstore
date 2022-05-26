import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_folder/helpers/error_handler.dart';
import 'package:flutter_folder/models/book.dart';
import 'package:flutter_folder/models/filter.dart';
import 'package:flutter_folder/models/newrelease.dart';
import 'package:flutter_folder/models/review.dart';
import 'package:flutter_folder/services/book_api.dart';
import 'package:http/http.dart' as http;
import '../models/constants.dart';

class BookModel extends ChangeNotifier {
  final BookApi _api = BookApi();

  List<Book> listBestSelling = [];
  List<NewReleaseModel> listNewRelease = [];
  List<Book> listDeal = [];
  Book? detail;
  late Filter filterData = Filter.empty();

  List<Book> _books = [];

  List<Book> get books {
    return [..._books];
  }

  Future<void> fetchAndSetBooks() async {
    print("fetchAndSetBooks: " + filterData.toJson().toString());
    String queryParams = '/books/books-for-sale?predicate=newest';
    if (filterData.categoryId != null) {
      queryParams += '&categoryId=${filterData.categoryId}';
    }
    if (filterData.authorId != null) {
      queryParams += '&authorId=${filterData.authorId}';
    }
    if (filterData.languageId != null) {
      queryParams += '&languageId=${filterData.languageId}';
    }
    if (filterData.attributeId != null) {
      queryParams += '&attributeId=${filterData.attributeId}';
    }
    if (filterData.minPrice > 0) {
      queryParams += '&minPrice=${filterData.minPrice}';
    }
    if (filterData.maxPrice > 0) {
      queryParams += '&maxPrice=${filterData.maxPrice}';
    }
    if (filterData.rate > 0) {
      queryParams += '&rates=${filterData.rate}';
    }
    if (filterData.pageIndex > 0) {
      queryParams += '&pageIndex=${filterData.pageIndex}';
    }

    if (filterData.pageSize > 0) {
      queryParams += '&pageSize=${filterData.pageSize}';
    }

    print("query params: " + queryParams);
    // final url = Uri.parse(apiEndpoint + queryParams);
    // final response = await http.get(url, headers: {
    //   'Content-Type': 'application/json',
    //   'Accept': 'application/json',
    // });

    var response = await withRestApiResponse(queryParams);

    final List<Book> loadedItems = [];
    List<dynamic>? extractedData;
    if (response.isNotEmpty) {
      extractedData = json.decode(response)["value"] as List<dynamic>;
    }
    // ignore: unnecessary_null_comparison
    if (extractedData == null) {
      return;
    }

    extractedData.forEach((item) {
      loadedItems.add(Book.fromJson(item));
    });

    _books.addAll(loadedItems.reversed.toList());
    notifyListeners();
  }

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
    print("setFilterData: " + filterData.toJson().toString());
    fetchAndSetBooks();
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
