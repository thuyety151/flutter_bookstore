import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/screens/cart/components/cart_list.dart';

import '../../mocks/models/cart_item.dart';
import 'components/cart_check_out.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart';

  const CartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: AppColors.kGrey,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Cart',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "${cartItems.length} items",
                style: const TextStyle(fontSize: 14),
              ),
            ],
          )),
      body: Column(
        children: const [
          CartList(),
          CartCheckOut(),
        ],
      ),
    );
  }
}
