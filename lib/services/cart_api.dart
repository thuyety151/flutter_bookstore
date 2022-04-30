import 'dart:convert';
import 'package:flutter_folder/helpers/error_handler.dart';
import 'package:flutter_folder/models/item.dart';
import 'package:flutter_folder/services/api_response_model.dart';

class CartApi {
  Future<ApiResponse<Item>> getCart() async => await withRestApiResponse(
      "/cart",
      (response) => {
            ApiResponse<Item>.fromJson(
                json.decode(response), Item.fromJsonModel)
          }).catchError((e) {});
}
