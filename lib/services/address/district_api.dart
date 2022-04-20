import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_folder/services/api_base.dart';
import 'package:flutter_folder/services/api_response_model.dart';
import 'package:flutter_folder/models/district.dart';

class DistrictApi {
  final Api _api = Api();

  Future<ApiResponse<District>> getDistricts() async {
    try {
      http.Request request = _api.getGHN("/district?province_id=202");
      var response = await http.Response.fromStream(await request.send());
      return ApiResponse<District>.fromJson(
          json.decode(response.body), District.fromJsonModel);
    } catch (e) {
      // TODO: show popup to notify error
      throw Exception(e);
    }
  }
}
