import 'package:flutter_folder/models/book.dart';

class NewReleaseModel {
  String categoryId;
  String categoryName;
  List<Book> books;

  NewReleaseModel(
      {required this.categoryId,
      required this.categoryName,
      required this.books});

  factory NewReleaseModel.fromJson(Map<String, dynamic> json) {
    var listBook = json["books"].cast<Map<String, dynamic>>();

    return NewReleaseModel(
        categoryId: json["categoryId"],
        categoryName: json["categoryName"],
        books: List<Book>.from(listBook.map((e) => Book.fromJson(e))));
  }

  static NewReleaseModel fromJsonModel(Map<String, dynamic> json) =>
      NewReleaseModel.fromJson(json);
}
