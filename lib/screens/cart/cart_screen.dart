import 'package:flutter/material.dart';
import 'package:flutter_folder/screens/cart/components/check_out_cart.dart';
import 'package:flutter_folder/screens/cart/components/list_item.dart';

import '../../mocks/models/cart.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Column(
        children: [
          Text('Your cart'),
          Text("${carts.length} items"),
        ],
      )),
      body: Column(
        children: [
          ListItem(),
          CheckOutCart(),
        ],
      ),
    );
  }
}
