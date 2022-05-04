import 'package:flutter/cupertino.dart';
import 'package:flutter_folder/models/book.dart';
import 'package:flutter_folder/models/filter.dart';
import 'package:flutter_folder/models/newrelease.dart';
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
    var response = await _api.getBookDetail(id);

    detail = response;
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
}
