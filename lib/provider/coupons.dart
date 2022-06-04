import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_folder/helpers/error_handler.dart';
import 'package:flutter_folder/models/coupon.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/constants.dart';
import 'package:http/http.dart' as http;


class Coupons with ChangeNotifier {
  List<Coupon> _coupons = [];
  List<Coupon> _userCoupons = [];
  late Coupon _selectedCoupon = Coupon.empty();
  static const storage = FlutterSecureStorage();

  List<Coupon> get coupons {
    return [..._coupons];
  }

  Coupon get selectedCoupon {
    return _selectedCoupon;
  }

  List<Coupon> get userCoupons {
    return [..._userCoupons];
  }

  Future<void> fetchCoupons() async {
    // final url = Uri.parse(apiEndpoint + '/coupons');
    // final response = await http.get(url, headers: {
    //   'Content-Type': 'application/json',
    //   'Accept': 'application/json',
    // });

    var res = await withRestApiResponse("/coupons");
    var value = json.decode(res)["value"] as List<dynamic>;

    final List<Coupon> loadedItems = [];
    List<dynamic>? extractedData;
    if (res.isNotEmpty) {
      extractedData = value;
    }
    // ignore: unnecessary_null_comparison
    if (extractedData == null) {
      return;
    }

    extractedData.forEach((item) {
      loadedItems.add(Coupon.fromJson(item));
    });

    _coupons = loadedItems.reversed.toList();
    notifyListeners();
  }

  Future<void> fetchUserCoupons() async {
    var token = await storage.read(key: "token");
    final url = Uri.parse(apiEndpoint + '/coupons/user-coupons');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    final List<Coupon> loadedItems = [];
    List<dynamic>? extractedData;
    if (response.body.isNotEmpty) {
      extractedData = json.decode(response.body)["value"] as List<dynamic>;
    }
    // ignore: unnecessary_null_comparison
    if (extractedData == null) {
      return;
    }

    extractedData.forEach((item) {
      loadedItems.add(Coupon.fromJson(item));
    });

    _userCoupons = loadedItems.reversed.toList();
    notifyListeners();
  }

  Future<String> saveUserCoupon(String couponId) async {
    final url = Uri.parse(apiEndpoint + '/coupons/save-user-coupon');
    var token = await storage.read(key: "token");
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'couponId': couponId,
        }),
      );

      if (response.body.contains("true")) {
        fetchUserCoupons();
        return "Save coupon successfully";
      } else {
        return json.decode(response.body)["error"];
      }
    } catch (error) {
      print(error);
      return error.toString();
      throw error;
    }
  }

  Future<String> setSelectedCoupon(String couponId) async {
    int indexSelectedCoupon =
        _userCoupons.indexWhere((element) => element.id == couponId);
    if (indexSelectedCoupon >= 0) {
      _selectedCoupon = _userCoupons[indexSelectedCoupon];
      notifyListeners();
      return "Apply coupon successfully";
    } else {
      return "Error when apply coupon";
    }
  }
}
