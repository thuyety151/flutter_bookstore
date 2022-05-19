import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_folder/helpers/error_handler.dart';
import 'package:flutter_folder/models/ghn/ghn_address.dart';
import 'package:flutter_folder/models/order.dart' as model;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import '../models/address.dart';
import '../models/constants.dart';

class UpdateOrderStatusParams {
  String id;
  String status;
  UpdateOrderStatusParams({required this.id, required this.status});
  String toJson() {
    Map<String, dynamic> map = {"id": id, "status": status};
    return json.encode(map);
  }
}

class Order with ChangeNotifier {
  static const storage = FlutterSecureStorage();
  late List<model.Order> listOrder = [];

  Future<void> createOrder(List<String> itemIds, String addressId,
      Address currentAddress, num orderFee) async {
    final url = Uri.parse(apiEndpoint + '"/orders/create"');
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
          'itemIds': itemIds,
          'addressId': addressId,
          'orderNote': 'flutter note',
          'coupon': null,
          'address': currentAddress,
          'orderFee': orderFee,
          'paymentMethod': "1",
        }),
      );

      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> getListOrders(String status) async {
    listOrder = [];
    try {
      var res = await withRestApiResponse("/orders/get-all?status=$status",
          hasLoading: true);
      var value = json.decode(res)["value"] as List<dynamic>;
      listOrder = value.map((e) => model.Order.fromJson(e)).toList();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> cancelOrder(String orderCode, Function onFailure) async {
    try {
      var resGHN = await withGHNApiResponse("/v2/switch-status/cancel",
          method: "post",
          body: json.encode({
            "order_codes": [orderCode],
            "shop_id": shopAddress.shopId
          }));

      if (json.decode(resGHN)["code"] == 200) {
        var res = await withRestApiResponse("/orders/update-order-status",
            method: "post",
            body: json.encode({"orderCode": orderCode}),
            hasLoading: true);
        if (json.decode(res)["isSuccess"] == true) {
          var current =
              listOrder.firstWhere((element) => element.orderCode == orderCode);
          current.status = "Cancel";
          listOrder = [
            ...listOrder.where((element) => element.orderCode != orderCode),
            current
          ];
        } else {
          onFailure(json.decode(res)["error"]);
        }
      }

      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
