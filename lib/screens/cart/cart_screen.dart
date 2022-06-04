import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/screens/cart/components/cart_list.dart';
import 'components/cart_check_out.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart';

  const CartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.kPrimary,
          foregroundColor: Colors.white,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Your Cart',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          )),
      body: SingleChildScrollView(
              child: Column(
          children: const [
            CartList(),
            CartCheckOut(),
          ],
        ),
      ),
    );
  }
}
