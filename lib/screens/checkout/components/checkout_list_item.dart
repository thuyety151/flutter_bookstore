import 'package:flutter/material.dart';
import '../../../mocks/models/cart_item.dart';
import 'checkout_item.dart';
class CheckoutList  extends StatefulWidget {
  const CheckoutList({Key? key}) : super(key: key);

  @override
  State<CheckoutList> createState() => _CheckoutListState();
}

class _CheckoutListState extends State<CheckoutList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Dismissible(
            key: Key(cartItems[index].book.id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                cartItems.removeAt(index);
              });
            },
            background: Container(
              padding:const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color:const Color(0xFFFFE6E6),
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
            child: CheckoutItem(checkoutItem: cartItems[index]),
          ),
        ),
      itemCount: cartItems.length,
      
    );
  }
}