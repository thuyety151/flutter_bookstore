import 'package:flutter/cupertino.dart';
import 'package:flutter_folder/models/item.dart';
import 'package:flutter_folder/services/cart_api.dart';

class CartModel extends ChangeNotifier {
  final CartApi _api = CartApi();

  List<Item> listItem = [];

  Future<void> getCart() async {
    var res = await _api.getCart();
    print(res);
  }
}
