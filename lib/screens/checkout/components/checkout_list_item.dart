import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/cart.dart';
import 'checkout_item.dart';

class CheckoutList extends StatefulWidget {
  const CheckoutList({Key? key}) : super(key: key);

  @override
  State<CheckoutList> createState() => _CheckoutListState();
}

class _CheckoutListState extends State<CheckoutList> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: CheckoutItem(checkoutItem: cart.items[index])),
      itemCount: cart.itemCount,
    );
  }
}
