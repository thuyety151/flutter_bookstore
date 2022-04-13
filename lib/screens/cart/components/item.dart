import 'package:flutter/material.dart';

import '../../../mocks/models/cart.dart';

class Item extends StatelessWidget {
  const Item({Key? key, required this.cart}) : super(key: key);

  final Cart cart;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Image.network(cart.book.imgUrl),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.book.name,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${cart.book.price}",
                style:
                    const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: " x ${cart.quantity}",
                    style: const TextStyle(color: Colors.grey)
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
