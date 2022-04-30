import 'dart:async';
import 'dart:convert';

import 'package:flutter_folder/helpers/error_handler.dart';
import 'package:flutter_folder/models/attribute.dart';
import 'package:flutter_folder/services/api_response_model.dart';

class AttributeApi {
  FutureOr<ApiResponse> getListAttribute() async {
    try {
      var res = await withRestApiResponse("/attributes");
      return ApiResponse<Attribute>.fromJson(
          json.decode(res), Attribute.fromJsonModel);
    } catch (e) {
      rethrow;
    }
  }
}
