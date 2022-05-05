import 'package:flutter/material.dart';
import './cart_item.dart' as CartItemChild;
import 'package:provider/provider.dart';
import '../../../provider/cart.dart';

class CartList extends StatefulWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Dismissible(
            key: Key(cart.items[index]!.id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                cart.removeItem(cart.items[index]!.id);
              });
            },
            background: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.restore_from_trash),
                  ),
                ],
              ),
            ),
            child: CartItemChild.CartItem(
                cart.items[index]!.id,
                cart.items[index]!.id,
                cart.items[index]!.price,
                cart.items[index]!.quantity,
                cart.items[index]!.title,
                cart.items[index]!.imageUrl,
                cart.items[index]!.attribute)),
      ),
      itemCount: cart.itemCount,
    );
  }
}
