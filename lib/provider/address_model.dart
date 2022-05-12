import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_folder/helpers/error_handler.dart';
import 'package:flutter_folder/main.dart';
import 'package:flutter_folder/models/address.dart';
import 'package:flutter_folder/services/address_api.dart';

class AddressModel extends ChangeNotifier {
  final AddressApi _api = AddressApi();
  List<Address> listAddresses = [];

  Future<void> createAddress(Address value) async {
    var res = await _api.createAddress(value);
    if (res) {
      Navigator.pop(navigatorKey.currentState!.overlay!.context);
    }
  }

  Future<void> getListAddresses() async {
    var res = await _api.getList();
    listAddresses = res.data ?? [];
    notifyListeners();
  }

  Future<void> deleteAddress(String id) async {
    try {
      var res =
          await withRestApiResponse("/addresses?id=$id", method: "delete");
      if (json.decode(res)["isSuccess"]) {
        listAddresses =
            listAddresses.where((element) => element.id != id).toList();
      } else {
        throw "false";
      }
    } catch (e) {
      rethrow;
    }
  }
}
