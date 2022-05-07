import 'package:flutter/foundation.dart';
import 'package:flutter_folder/models/ghn/district.dart';
import 'package:flutter_folder/models/ghn/province.dart';
import 'package:flutter_folder/models/ghn/ward.dart';

import 'package:flutter_folder/services/ghn/address_picker_api.dart';

class GHNModel extends ChangeNotifier {
  List<Province> listProvince = [];
  List<District> listDistrict = [];
  List<Ward> listWard = [];

  final AddressPickerApi _api = AddressPickerApi();

  Future<void> getListProvince() async {
    var response = await _api.getListProvince();
    listProvince = response.data as List<Province>;
    notifyListeners();
  }

  Future<void> getListDistrict(String provinceId) async {
    var response = await _api.getListDistrict(provinceId);
    listDistrict = response.data as List<District>;
    notifyListeners();
  }

  Future<void> getListWard(String districtId) async {
    var response = await _api.getListWard(districtId);
    listWard = response.data as List<Ward>;
    notifyListeners();
  }
}
