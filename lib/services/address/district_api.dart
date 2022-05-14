import 'dart:convert';
import 'package:flutter_folder/helpers/error_handler.dart';
import 'package:flutter_folder/models/ghn/district.dart';
import 'package:flutter_folder/services/api_response_model.dart';

class DistrictApi {
  Future<ApiResponse<District>> getDistricts() async {
    try {
      var res = await withGHNApiResponse("/district?province_id=202");
      return ApiResponse<District>.fromJson(
          json.decode(res), District.fromJsonModel);
    } catch (e) {
      rethrow;
    }
  }
}
