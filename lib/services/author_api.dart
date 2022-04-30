import 'dart:convert';

import 'package:flutter_folder/models/author.dart';
import 'package:flutter_folder/services/api_base.dart';
import 'package:flutter_folder/services/api_response_model.dart';
import 'package:http/http.dart' as http;

class AuthorApi {
  final Api _api = Api();

  Future<ApiResponse<Author>> getListAuthor() async {
    try {
      var request = await _api.get("/authors");
      var response = await http.Response.fromStream(await request.send());
      return ApiResponse<Author>.fromJson(
          json.decode(response.body), Author.fromJsonModel);
    } catch (e) {
      rethrow;
    }
  }
}
