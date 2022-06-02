import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_folder/models/ghn/service-type.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../models/address.dart';
import '../models/constants.dart';
import '../models/ghn/ghn_address.dart';
import '../models/http_exception.dart';
import '../models/item.dart';

class Order with ChangeNotifier {
  static const storage = FlutterSecureStorage();

  Future<void> createOrder(
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
      print('save order db');

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
      print('save order db done');
      if (response.body.contains("true")) {
        print('save order ghn');
        String orderId = json.decode(response.body)["value"] as String;
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
          'cod_amount':
              paymentMethod == 'MoMo' ? 0 : (orderFee * 23000).round(),
          'pick_station_id': 1444,
          'items': items.map((item) => {
                'name': item.productName,
                'quantity': item.quantity,
                'price': (item.price! * 23000).round(),
                'category': {
                  'level1': "book",
                },
              })
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
          print('save order ghn done');
          if (responseCreateOrderGNH.body.isNotEmpty &&
              responseCreateOrderGNH.statusCode == 200) {
            print('save update order code');
            String orderCode = json.decode(responseCreateOrderGNH.body)["data"]
                ["order_code"] as String;
            // Integrate API UPDATE ORDER CODE
            final response = await http.post(
              url,
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
          print('save update order code');
        } catch (error) {
          // Delete order when create GHN fail
          final id = orderId;
          final urlDel = Uri.parse(apiEndpoint + '/cart/item?id=$id');
          final response = await http.delete(
            urlDel,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
          );
        }
      }
      ;
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> momoPayment(String orderId) async {
    final url = Uri.parse(apiEndpoint + '/momo');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'orderId': orderId,
        }),
      );

      print(response.body);
      // notifyListeners();
    } catch (error) {
      print(error);
      throw error;
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
}
