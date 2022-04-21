import 'package:flutter/cupertino.dart';
import 'package:flutter_folder/models/book.dart';
import 'package:flutter_folder/models/newrelease.dart';
import 'package:flutter_folder/services/book_api.dart';
import 'package:provider/provider.dart';

class BookModel extends ChangeNotifier {
  final BookApi _api = BookApi();

  List<Book> listBestSelling = [];
  List<NewReleaseModel> listNewRelease = [];
  List<Book> listDeal = [];

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
    print("delas");
    listDeal = response.data as List<Book>;
    notifyListeners();
  }
}
