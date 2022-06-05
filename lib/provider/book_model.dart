import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_folder/helpers/error_handler.dart';
import 'package:flutter_folder/models/book.dart';
import 'package:flutter_folder/models/filter.dart';
import 'package:flutter_folder/models/newrelease.dart';
import 'package:flutter_folder/models/review.dart';
import 'package:flutter_folder/services/api_response_model.dart';
import 'package:flutter_folder/services/book_api.dart';

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
    String queryParams = '/books/books-for-sale?predicate=newest';
    if (filterData.keywords!.isNotEmpty) {
      queryParams += '&keywords=${filterData.keywords}';
      filterData.pageIndex = 1;
    }
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

    var response = await withRestApiResponse(queryParams);

    final List<Book> loadedItems = [];
    List<dynamic>? extractedData;
    if (response != null) {
      extractedData = json.decode(response)["value"] as List<dynamic>;
    }
    // ignore: unnecessary_null_comparison
    if (extractedData == null) {
      return;
    }

    // ignore: avoid_function_literals_in_foreach_calls
    extractedData.forEach((item) {
      loadedItems.add(Book.fromJson(item));
    });

    if (filterData.pageIndex == 1) {
      _books = loadedItems.toList();
    } else {
      _books.addAll(loadedItems.reversed.toList());
    }

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
    fetchAndSetBooks();
    notifyListeners();
  }

  void setKeyword(String keyword) {
    filterData.keywords = keyword;
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
      detail?.reviews =
          ApiResponse<Review>.fromJson(json.decode(res), Review.fromJsonModel)
                  .data ??
              [];
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  void setCategoryId(String id) {
    filterData.categoryId = id;
    notifyListeners();
  }

  void setAuthorId(String id) {
    filterData.authorId = id;
    notifyListeners();
  }

  void setInit(String? categoryId, String? authorId) {
    if (categoryId != null) {
      filterData.categoryId = categoryId;
    }
    if (authorId != null) {
      filterData.authorId = authorId;
    }
    filterData.keywords = "";
    notifyListeners();
  }
}
