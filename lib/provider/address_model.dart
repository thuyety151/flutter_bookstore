import 'dart:convert';
import 'package:flutter_folder/helpers/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folder/main.dart';
import 'package:flutter_folder/models/address.dart';
import 'package:flutter_folder/services/address_api.dart';
import 'package:flutter_folder/services/api_response_model.dart';

class AddressModel extends ChangeNotifier {
  final AddressApi _api = AddressApi();
  List<Address> listAddresses = [];
  Address _defaultAddress = Address.empty();

  Address get defaulAddress => _defaultAddress;

  Future<void> createAddress(Address value) async {
    var res = await _api.createAddress(value);
    if (res) {
      ScaffoldMessenger.of(navigatorKey.currentState!.overlay!.context)
          .hideCurrentSnackBar();
      ScaffoldMessenger.of(navigatorKey.currentState!.overlay!.context)
          .showSnackBar(const SnackBar(
        content: Text("Create address successfully!"),
        duration: Duration(seconds: 1),
      ));
      getListAddresses();
    }
  }

  Future<void> getListAddresses() async {
    var res = await withRestApiResponse("/addresses");
    json.decode(res)["value"].cast<Map<String, dynamic>>();
    listAddresses =
        ApiResponse<Address>.fromJson(json.decode(res), Address.fromJsonModel)
            .data as List<Address>;

    _defaultAddress =
        listAddresses.firstWhere((element) => element.isMain == true);
    notifyListeners();
  }

  Future<void> deleteAddress(String id) async {
    try {
      var res =
          await withRestApiResponse("/addresses?id=$id", method: "delete");
      if (json.decode(res)["isSuccess"]) {
        listAddresses =
            listAddresses.where((element) => element.id != id).toList();
        getListAddresses();
      } else {
        throw "false";
      }
    } catch (e) {
      rethrow;
    }
  }
}
