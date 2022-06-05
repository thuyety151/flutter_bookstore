import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_folder/helpers/error_handler.dart';
import 'package:flutter_folder/models/ghn/ghn_address.dart';
import 'package:flutter_folder/models/item.dart';
import 'package:flutter_folder/models/order.dart' as model;
import 'package:flutter_folder/models/ghn/service-type.dart';
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

class CategoryGHN {
  String level1;
  CategoryGHN(this.level1);

  Map<String, dynamic> toJson() => {"level1": level1};
}

class ItemGHN {
  String name;
  int quantity;
  int price;
  CategoryGHN category;

  ItemGHN(this.name, this.quantity, this.price, this.category);

  Map<String, dynamic> toJson() => {
        "name": name,
        "quantity": quantity,
        "price": price,
        "category": category
      };
}

class Order with ChangeNotifier {
  static const storage = FlutterSecureStorage();
  late List<model.Order> listOrder = [];

  Future<String> createOrder(
      List<String> itemIds,
      String addressId,
      Address currentAddress,
      num orderFee,
      ServiceType serviceType,
      String paymentMethod,
      List<Item> items) async {
    final url = Uri.parse(apiEndpoint + '/orders/create');
    var token = await storage.read(key: "token");
    try {
      //currentAddress.id = null;
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
          'address': {
            "firstName": currentAddress.firstName,
            "lastName": currentAddress.lastName,
            "phone": currentAddress.phone,
            "apartmentNumber": currentAddress.apartmentNumber,
            "streetAddress": currentAddress.streetAddress,
            "districtId": currentAddress.districtID,
            "provinceId": currentAddress.provinceID,
            "isMain": currentAddress.isMain,
            "provinceName": currentAddress.provinceName,
            "districtName": currentAddress.districtName,
            "wardName": currentAddress.wardName,
            "wardCode": currentAddress.wardCode
          },
          'orderFee': orderFee,
          'paymentMethod': 1,
        }),
      );

      String orderId = '';
      if (response.body.contains("true")) {
        orderId = json.decode(response.body)["value"] as String;
        final order = {
          'payment_type_id': 2,
          'note': 'flutter note',
          'return_phone': currentAddress.phone,
          'return_address': formatAddress(
              apartmentNumber: currentAddress.apartmentNumber,
              streetAddress: currentAddress.streetAddress,
              wardName: currentAddress.wardName,
              districtName: currentAddress.districtName,
              provinceName: currentAddress.provinceName),
          'return_district_id': shopAddress.districtId,
          'return_ward_code': shopAddress.wardCode,
          'to_name': currentAddress.firstName! + " " + currentAddress.lastName!,
          'to_phone': currentAddress.phone,
          'to_address': formatAddress(
              apartmentNumber: currentAddress.apartmentNumber,
              streetAddress: currentAddress.streetAddress,
              wardName: currentAddress.wardName,
              districtName: currentAddress.districtName,
              provinceName: currentAddress.provinceName),
          'to_district_id': currentAddress.districtID,
          'to_ward_code': currentAddress.wardCode,
          'required_note': "KHONGCHOXEMHANG",
          'deliver_station_id': null,
          'weight': 200,
          'order_value': (orderFee * 23000).round(),
          'service_type_id': serviceType.serviceTypeId,
          'service_id': serviceType.serviceId,
          'insurance_value': (orderFee * 23000).round(),
          'cod_amount': paymentMethod == 'Payment with MoMo'
              ? 0
              : (orderFee * 23000).round(),
          'pick_station_id': 1444,
          // 'items': json.encode(items.map((e) => e.toJson())),

          "items": items
              .map((e) => ItemGHN(e.productName ?? "", e.quantity ?? 1,
                  (e.price ?? 0 * 23000).round(), CategoryGHN("book")))
              .toList()
          // items.map((item) => {
          //       'name': item.productName,
          //       'quantity': item.quantity,
          //       'price': (item.price! * 23000).round(),
          //       'category': {
          //         'level1': "book",
          //       },
          //     })
        };
        try {
          const ghnEnpoint =
              'https://dev-online-gateway.ghn.vn/shiip/public-api';
          final url = Uri.parse(ghnEnpoint + "/v2/shipping-order/create");
          final responseCreateOrderGNH = await http.post(
            url,
            headers: {
              "content-type": "application/json; charset=utf-8",
              "Token": "a907bd6b-3508-11ec-b514-aeb9e8b0c5e3"
            },
            body: json.encode(order),
          );
          if (responseCreateOrderGNH.body.isNotEmpty &&
              responseCreateOrderGNH.statusCode == 200) {
            String orderCode = json.decode(responseCreateOrderGNH.body)["data"]
                ["order_code"] as String;
            // Integrate API UPDATE ORDER CODE
            await http.post(
              Uri.parse(apiEndpoint + '/orders/update-order-code'),
              headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': 'Bearer $token',
              },
              body: json.encode({
                'id': orderId,
                'orderCode': orderCode,
              }),
            );
          }
        } catch (error) {
          // Delete order when create GHN fail
          final id = orderId;
          final urlDel = Uri.parse(apiEndpoint + '/cart/item?id=$id');
          await http.delete(
            urlDel,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
          );
        }
      }
      return orderId;
    } catch (error) {
      // ignore: use_rethrow_when_possible
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
      } else {
        onFailure();
      }

      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  String formatAddress({
    apartmentNumber,
    streetAddress,
    wardName,
    districtName,
    provinceName,
  }) {
    final addressList = <String>[
      apartmentNumber,
      streetAddress,
      wardName,
      districtName,
      provinceName
    ]; // Creates growable list.
    return addressList.join(', ');
  }

  Map<String, dynamic> createOrderToJson(List<String> itemIds, String addressId,
          Address currentAddress, num orderFee) =>
      {
        'itemIds': itemIds,
        'addressId': addressId,
        'orderNote': 'flutter note',
        'coupon': null,
        'address': currentAddress,
        'orderFee': orderFee,
        'paymentMethod': 1,
      };
}
