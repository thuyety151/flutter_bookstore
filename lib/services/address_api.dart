import 'dart:async';
import 'dart:convert';

import 'package:flutter_folder/helpers/error_handler.dart';
import 'package:flutter_folder/models/address.dart';

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
}
