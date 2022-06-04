import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_folder/helpers/error_handler.dart';
import 'package:flutter_folder/models/item.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/constants.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';

class Cart with ChangeNotifier {
  List<Item> _items = [];
  static const storage = FlutterSecureStorage();

  List<Item> get items {
    return [..._items];
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    // ignore: avoid_function_literals_in_foreach_calls
    _items.forEach((item) {
      total += (item.price ?? 0) * (item.quantity ?? 1);
    });
    return total;
  }

  Future<void> fetchAndSetCart() async {
    var token = await storage.read(key: "token");
    final url = Uri.parse(apiEndpoint + '/cart');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    final List<Item> loadedItems = [];
    List<dynamic>? extractedData;
    extractedData = json.decode(response.body)["value"] as List<dynamic>;
    // ignore: unnecessary_null_comparison
    if (extractedData == null) {
      return;
    }

    // ignore: avoid_function_literals_in_foreach_calls
    extractedData.forEach((item) {
      loadedItems.add(Item.fromJson(item));
    });

    _items = loadedItems.reversed.toList();
    notifyListeners();
  }

  Future<void> addOrUpdateItem(
      String productId, String attributeId, int quantity) async {

    try {
      await withRestApiResponse("/cart/item",
          method: "post",
          body: json.encode({
            'productId': productId,
            'attributeId': attributeId,
            'quantity': quantity
          }));

      int index = _items.indexWhere((element) =>
          element.productId == productId && element.attributeId == attributeId);

      if (index == -1) {
        final newItem = Item(id: 'tempItem');
        _items.add(newItem);
      } else {
        Item existingItem = _items[index];
        existingItem.quantity = quantity;
        if (existingItem.quantity! <= 0) {
          deleteItem(existingItem.id ?? "1");
        } else {
          _items[index] = existingItem;
        }
      }
      notifyListeners();
    } catch (error) {
      // ignore: use_rethrow_when_possible
      throw error;
    }
  }

  Future<void> deleteItem(String id) async {
    var token = await storage.read(key: "token");
    final url = Uri.parse(apiEndpoint + '/cart/item?id=$id');
    final existingitemIndex = _items.indexWhere((item) => item.id == id);
    Item? existingItem = _items[existingitemIndex];
    _items.removeAt(existingitemIndex);
    notifyListeners();
    final response = await http.delete(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode >= 400) {
      _items.insert(existingitemIndex, existingItem);
      notifyListeners();
      throw HttpException('Could not delete item.');
    }
    existingItem = null;
  }
}
