import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_folder/helpers/error_handler.dart';
import 'package:flutter_folder/models/address.dart';
import 'package:flutter_folder/models/ghn/ghn_address.dart';
// import 'package:http/http.dart' as http;

import '../models/ghn/service-type.dart';

class ShippingFee with ChangeNotifier {
  num serviceFee = 0;

  Future<void> getFee(Address currentAddress, ServiceType serviceType) async {
    if (serviceType.serviceId == null) {
      return;
    }
    try {
      print('start get fee');

      const ghnEnpoint = 'https://dev-online-gateway.ghn.vn/shiip/public-api';
      final url = Uri.parse(ghnEnpoint + "/v2/shipping-order/fee");
      final response = await withGHNApiResponse("/v2/shipping-order/fee",
          method: "post",
          body: json.encode({
            "from_district_id": shopAddress.districtId,
            "service_id": serviceType.serviceId,
            "service_type_id": serviceType.serviceTypeId,
            "to_district_id": currentAddress.districtID,
            "to_ward_code": null,
            "height": 50,
            "length": 20,
            "weight": 200,
            "width": 20,
            "coupon": null
          }));

      // final response = await http.post(
      //   url,
      //   headers: {
      //     "content-type": "application/json; charset=utf-8",
      //     "Token": "a907bd6b-3508-11ec-b514-aeb9e8b0c5e3"
      //   },
      //   body: json.encode({
      //     "from_district_id": shopAddress.districtId,
      //     "service_id": serviceType.serviceId,
      //     "service_type_id": serviceType.serviceTypeId,
      //     "to_district_id": currentAddress.districtID,
      //     "to_ward_code": null,
      //     "height": 50,
      //     "length": 20,
      //     "weight": 200,
      //     "width": 20,
      //     "coupon": null
      //   }),
      // );

      print(
        json.encode({
          "from_district_id": shopAddress.districtId,
          "service_id": serviceType.serviceId,
          "service_type_id": serviceType.serviceTypeId,
          "to_district_id": currentAddress.districtID,
          "to_ward_code": currentAddress.wardName,
          "height": 50,
          "length": 20,
          "weight": 200,
          "width": 20,
          "coupon": null
        }),
      );
      print('end get fee');
      print(response.body);
      if (response.body.isNotEmpty && response.body.contains("Success")) {
        print(response.body);
        serviceFee = json.decode(response.body)["data"]["service_fee"] as num;
        notifyListeners();
      } else {
        return;
      }
    } catch (e) {
      rethrow;
    }
  }
}
