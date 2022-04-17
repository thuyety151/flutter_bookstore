import 'package:flutter/material.dart';
import 'package:flutter_folder/screens/cart/components/cart_list.dart';

import '../../mocks/models/cart_item.dart';
import 'components/cart_check_out.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Column(
        children: [
          Text('Your cart 2'),
          Text("${cartItems.length} items"),
        ],
      )),
      body: Column(
        children: [
          CartList(),
          CartCheckOut(),
        ],
      ),
    );
  }
}
