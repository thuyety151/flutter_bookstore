import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_folder/helpers/error_handler.dart';
// import 'package:flutter_folder/models/address.dart';
import 'package:flutter_folder/models/ghn/ghn_address.dart';
// import 'package:http/http.dart' as http;

import '../models/ghn/service-type.dart';

class Shipping with ChangeNotifier {
  List<ServiceType> _serviceTypes = [];

  List<ServiceType> get serviceTypes {
    return [..._serviceTypes];
  }

  Future<void> getServiceType(int currentAddress) async {
    try {
    
      var response =
          await withGHNApiResponse("/v2/shipping-order/available-services",
              method: "post",
              body: json.encode({
                "shop_id": shopAddress.shopId,
                "from_district": shopAddress.districtId,
                "to_district": currentAddress
              }));
     
      final List<ServiceType> loadedServiceTypes = [];
      List<dynamic>? extractedData;
      if (response.isNotEmpty) {

        extractedData = json.decode(response)["data"] as List<dynamic>;
      }
      if (extractedData == null) {
        return;
      }

      int count = 0;
      // ignore: avoid_function_literals_in_foreach_calls
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
      final index = _serviceTypes.indexWhere((item) =>
          item.serviceId == newValues.serviceId &&
          item.serviceTypeId == newValues.serviceTypeId);
      if (index >= 0) {
        // ignore: avoid_function_literals_in_foreach_calls
        _serviceTypes.forEach((element) {
          element.isMain = false;
        });
        final newProduct = _serviceTypes[index];
        newProduct.isMain = true;
        _serviceTypes[index] = newProduct;

        notifyListeners();
      } 
    } catch (error) {
      rethrow;
    }
  }

  ServiceType getDefaultServiceType() {
    return _serviceTypes.firstWhere((element) => element.isMain == true);
  }
}
