import 'dart:convert';

import 'package:flutter_folder/models/category.dart';
import 'package:flutter_folder/services/api_base.dart';
import 'package:flutter_folder/services/api_response_model.dart';
import 'package:http/http.dart' as http;

class CategoryApi {
  final Api _api = Api();

  Future<ApiResponse<Category>> getTopCategory() async {
    try {
      var request = await _api.get("/categories");
      var response = await http.Response.fromStream(await request.send());
      return ApiResponse<Category>.fromJson(
          json.decode(response.body), Category.fromJsonModel);
    } catch (e) {
      rethrow;
    }
  }
}
