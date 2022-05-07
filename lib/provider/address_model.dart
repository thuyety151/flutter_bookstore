import 'package:flutter/cupertino.dart';
import 'package:flutter_folder/main.dart';
import 'package:flutter_folder/models/address.dart';
import 'package:flutter_folder/services/address_api.dart';

class AddressModel extends ChangeNotifier {
  final AddressApi _api = AddressApi();

  Future<void> createAddress(Address value) async {
    var res = await _api.createAddress(value);
    if (res) {
      Navigator.pop(navigatorKey.currentState!.overlay!.context);
    }
  }
}