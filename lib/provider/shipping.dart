import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_folder/models/address.dart';
import 'package:flutter_folder/models/ghn/ghn_address.dart';
import 'package:http/http.dart' as http;

import '../models/ghn/service-type.dart';

class Shipping with ChangeNotifier {
  List<ServiceType> _serviceTypes = [];

  List<ServiceType> get serviceTypes {
    return [..._serviceTypes];
  }

  Future<void> getServiceType(int currentAddress) async {
    try {
      print('start');
      print(currentAddress);
      const ghnEnpoint = 'https://dev-online-gateway.ghn.vn/shiip/public-api';
      final url =
          Uri.parse(ghnEnpoint + "/v2/shipping-order/available-services");
      final response = await http.post(
        url,
        headers: {
          "content-type": "application/json; charset=utf-8",
          "Token": "a907bd6b-3508-11ec-b514-aeb9e8b0c5e3"
        },
        body: json.encode({
          "shop_id": shopAddress.shopId,
          "from_district": shopAddress.districtId,
          "to_district": currentAddress
        }),
      );
      print('emd');
      final List<ServiceType> loadedServiceTypes = [];
      List<dynamic>? extractedData;
      if (response.body.isNotEmpty) {
        print(response.body);
        extractedData = json.decode(response.body)["data"] as List<dynamic>;
      }
      if (extractedData == null) {
        return;
      }

      int count = 0;
      extractedData.forEach((item) {
        var serviceType = ServiceType.fromJson(item);
        if (serviceType.shortName != "") {
          if (count == 1) {
            serviceType.isMain = true;
          } else {
            serviceType.isMain = false;
          }
          count++;
          loadedServiceTypes.add(serviceType);
        }
      });

      _serviceTypes = loadedServiceTypes.reversed.toList();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> setSelectedServiceType(ServiceType newValues) async {
    try {
      print("..start setSelectedServiceType ");
      final index = _serviceTypes.indexWhere((item) =>
          item.serviceId == newValues.serviceId &&
          item.serviceTypeId == newValues.serviceTypeId);
      if (index >= 0) {
        _serviceTypes.forEach((element) {
          element.isMain = false;
        });
        final newProduct = _serviceTypes[index];
        newProduct.isMain = true;
        _serviceTypes[index] = newProduct;
        _serviceTypes.forEach((element) {
          print(element.isMain);
        });

        notifyListeners();
      } else {
        print('...');
      }
    } catch (error) {
      print("..error");
      rethrow;
    }
  }

  ServiceType getDefaultServiceType() {
    return _serviceTypes.firstWhere((element) => element.isMain == true);
  }
}
