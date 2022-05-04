import 'package:flutter/material.dart';
import 'package:flutter_folder/screens/cart/components/cart_item.dart';
import '../../../mocks/models/cart_item.dart';
class CartList  extends StatefulWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) => Padding(
          padding:const  EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(cartItems[index].book.id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                cartItems.removeAt(index);
              });
            },
            background: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color:const  Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                 const  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.restore_from_trash),
                  ),
                ],
              ),
            ),
            child: CartItem(cartItem: cartItems[index]),
          ),
        ),
      itemCount: cartItems.length,
      
    );
  }
}