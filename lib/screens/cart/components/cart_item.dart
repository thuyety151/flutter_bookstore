import 'package:flutter/material.dart';

import '../../../components/custom_text_style.dart';
import '../../../mocks/models/cart_item.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key, required this.cartItem}) : super(key: key);

  final CartItemModel cartItem;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(
                16,
              ))),
          child: Row(children: [
            Container(
              margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  color: Colors.blue.shade200,
                  image: DecorationImage(
                    image: NetworkImage(cartItem.book.imgUrl),
                  )),
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 8, top: 4),
                      child: Text(
                        cartItem.book.name,
                        maxLines: 2,
                        softWrap: true,
                        style: CustomTextStyle.textFormFieldSemiBold
                            .copyWith(fontSize: 14),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Paperpack",
                      style: CustomTextStyle.textFormFieldRegular
                          .copyWith(color: Colors.grey, fontSize: 14),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$ " + cartItem.book.price.toString(),
                            style: CustomTextStyle.textFormFieldBlack
                                .copyWith(color: Colors.red),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.remove,
                                  ),
                                  Container(
                                    color: Colors.grey.shade200,
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 3, right: 12, left: 12),
                                    child: Text(
                                      "1",
                                      style:
                                          CustomTextStyle.textFormFieldSemiBold,
                                    ),
                                  ),
                                  Icon(Icons.add)
                                ],
                              ))
                        ],
                      ),
                    )
                  ]),
            ))
          ]),
        )
      ],
    );
  }
}
