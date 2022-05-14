import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../models/address.dart';
import '../models/constants.dart';
import '../models/http_exception.dart';

class Order with ChangeNotifier {
   static const storage = FlutterSecureStorage();
   
  Future<void> createOrder(
      List<String> itemIds, String addressId, Address currentAddress,num orderFee) async {
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

  
}
