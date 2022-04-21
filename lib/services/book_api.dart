import 'dart:convert';
import 'package:flutter_folder/models/book.dart';
import 'package:flutter_folder/models/newrelease.dart';
import 'package:flutter_folder/services/api_base.dart';
import 'package:flutter_folder/services/api_response_model.dart';
import 'package:http/http.dart' as http;

class BookApi {
  final Api _api = Api();

  Future<ApiResponse> bestSelling() async {
    try {
      var request = _api.get("/books/best-selling");
      var response = await http.Response.fromStream(await request.send());
      return ApiResponse<Book>.fromJson(
          json.decode(response.body), Book.fromJsonModel);
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse> getListNewrelease() async {
    try {
      var request = _api.get("/books/new-releases");
      var response = await http.Response.fromStream(await request.send());
      return ApiResponse<NewReleaseModel>.fromJson(
          json.decode(response.body), NewReleaseModel.fromJsonModel);
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<Book>> getBookForSales(String predicate) async {
    try {
      var request = _api.get("/books/books-for-sale?predicate=$predicate");
      var response = await http.Response.fromStream(await request.send());
      return ApiResponse<Book>.fromJson(
          json.decode(response.body), Book.fromJsonModel);
    } catch (e) {
      rethrow;
    }
  }
}
