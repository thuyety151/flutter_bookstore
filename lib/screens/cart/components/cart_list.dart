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
    return FutureBuilder(
      future: Provider.of<Cart>(context, listen: false).fetchAndSetCart(),
      builder: (ctx, dataSnapshot) {
        if (dataSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (dataSnapshot.error != null) {
            // ...
            // Do error handling stuff
            return Center(
              child: Text('An error occurred!'),
            );
          } else {
            return Consumer<Cart>(
              builder: (_, cart, ch) => ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Dismissible(
                      key: Key(cart.items[index].id ?? ""),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        cart.deleteItem(cart.items[index].id ?? "");
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
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      child: CartItemChild.CartItem(cart.items[index])),
                ),
                itemCount: cart.itemCount,
              ),
            );
          }
        }
      },
    );
  }
}
