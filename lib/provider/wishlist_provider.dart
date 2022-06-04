import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_folder/helpers/error_handler.dart';
import 'package:flutter_folder/models/item.dart';

class WishlistProvider extends ChangeNotifier {
  late List<Item> listWishlist = [];

  Future<void> addToWishlist(
      Item item, Function onSuccess, Function onFailure) async {
    try {
      var res = await withRestApiResponse("/wishlist/item",
          method: "post", hasLoading: true, body: toBodyJson(item));
      if (json.decode(res)["isSuccess"] == true) {
        onSuccess();
      }
    } catch (e) {
      onFailure(e);
      rethrow;
    }
  }

  Future<void> addToCart(
      String? id, Function onSuccess, Function onFailure) async {
    if (id == null) {
      return;
    }
    try {
      var res = await withRestApiResponse("/wishlist?id=$id",
          method: "post", hasLoading: true);
      if (json.decode(res)["isSuccess"] == true) {
        onSuccess();
        listWishlist =
            listWishlist.where((element) => element.id != id).toList();
        notifyListeners();
      }
    } catch (e) {
      onFailure(e);
      rethrow;
    }
  }

  Future<void> deleteItem(
      String? id, Function onSuccess, Function onFailure) async {
    if (id == null) {
      return;
    }
    try {
      var res = await withRestApiResponse("/wishlist/item?id=$id",
          method: "delete", hasLoading: true);
      if (json.decode(res)["isSuccess"] == true) {
        onSuccess();
        listWishlist =
            listWishlist.where((element) => element.id != id).toList();
        notifyListeners();
      }
    } catch (e) {
      onFailure(e);
      rethrow;
    }
  }

  Future<void> getList() async {
    try {
      var res = await withRestApiResponse("/wishlist");
      var value = json.decode(res)["value"] as List<dynamic>;
      listWishlist = value.map((e) => Item.fromJson(e)).toList();

      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  String toBodyJson(Item item) {
    return json.encode({
      "productId": item.productId,
      "quantity": item.quantity,
      "attributeId": item.attributeId
    });
  }
}
