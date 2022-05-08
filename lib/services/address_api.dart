import 'dart:async';
import 'dart:convert';

import 'package:flutter_folder/helpers/error_handler.dart';
import 'package:flutter_folder/models/address.dart';
import 'package:flutter_folder/services/api_response_model.dart';

class AddressApi {
  FutureOr<bool> createAddress(Address value) async {
    try {
      var res = await withRestApiResponse("/addresses",
          method: "post", body: value.toJson());
      return json.decode(res)["isSuccess"];
    } catch (e) {
      rethrow;
    }
  }

  FutureOr<ApiResponse<Address>> getList() async {
    try {
      var res = await withRestApiResponse("/addresses");
      return ApiResponse<Address>.fromJson(
          json.decode(res), Address.fromJsonModel);
    } catch (e) {
      rethrow;
    }
  }
}
