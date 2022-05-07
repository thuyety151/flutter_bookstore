import 'dart:async';
import 'dart:convert';
import 'package:flutter_folder/helpers/error_handler.dart';
import 'package:flutter_folder/models/ghn/district.dart';
import 'package:flutter_folder/models/ghn/province.dart';
import 'package:flutter_folder/models/ghn/ward.dart';
import 'package:flutter_folder/services/api_response_model.dart';

class AddressPickerApi {
  Future<ApiResponse<Province>> getListProvince() async {
    try {
      var res = await withGHNApiResponse("/province");
      return ApiResponse<Province>.fromJson(
          json.decode(res), Province.fromJsonModel);
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<District>> getListDistrict(String provinceID) async {
    try {
      var res = await withGHNApiResponse("/district?province_id=$provinceID");
      return ApiResponse<District>.fromJson(
          json.decode(res), District.fromJsonModel);
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<Ward>> getListWard(String districtID) async {
    try {
      var res = await withGHNApiResponse("/ward?district_id=$districtID");
      return ApiResponse<Ward>.fromJson(json.decode(res), Ward.fromJsonModel);
    } catch (e) {
      rethrow;
    }
  }
}
