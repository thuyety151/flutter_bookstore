import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_folder/configs/apiGHNUri.dart';
import 'package:flutter_folder/models/ApiResponse.dart';
import 'package:flutter_folder/models/core/address/District.dart';

class DistrictApi {
  Future<ApiResponse<District>> getDistricts() async {
    try {
      http.Request request = getGHNUri("/district?province_id=202", "get");
      var response = await http.Response.fromStream(await request.send());
      return ApiResponse<District>.fromJson(
          json.decode(response.body), District.fromJsonModel);
    } catch (e) {
      // TODO: show popup to notify error
      throw Exception(e);
    }
  }
}
