import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/custom_text_style.dart';
import '../../../models/item.dart';
import '../../../provider/cart.dart';

class CartItem extends StatelessWidget {
  final Item item;
  CartItem(this.item);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(
                16,
              ))),
          child: Row(children: [
            Container(
              margin:
                  const EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                  color: Colors.blue.shade200,
                  image: DecorationImage(
                    image: NetworkImage(item.pictureUrl ?? ""),
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
                      padding: const EdgeInsets.only(right: 8, top: 4),
                      child: Text(
                        item.productName ?? "",
                        maxLines: 2,
                        softWrap: true,
                        style: CustomTextStyle.textFormFieldSemiBold
                            .copyWith(fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item.attributeName ?? "",
                      style: CustomTextStyle.textFormFieldRegular
                          .copyWith(color: Colors.grey, fontSize: 14),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$ " + item.price.toString(),
                          style: CustomTextStyle.textFormFieldBlack
                              .copyWith(color: Colors.red),
                        ),
                        Consumer<Cart>(
                          builder: (context, cart, child) {
                            return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      child: Icon(Icons.remove),
                                      onTap: () {
                                        print("decrease item");
                                        cart.addOrUpdateItem(
                                            item.productId!,
                                            item.attributeId!,
                                            item.quantity! - 1);
                                      },
                                    ),
                                    Container(
                                      color: Colors.grey.shade200,
                                      padding: const EdgeInsets.only(
                                          top: 5,
                                          bottom: 3,
                                          right: 12,
                                          left: 12),
                                      child: Text(
                                        item.quantity.toString(),
                                        style: CustomTextStyle
                                            .textFormFieldSemiBold,
                                      ),
                                    ),
                                    InkWell(
                                      child: Icon(Icons.add),
                                      onTap: () {
                                        print("add item");
                                        cart.addOrUpdateItem(
                                            item.productId!,
                                            item.attributeId!,
                                            item.quantity! + 1);
                                      },
                                    ),
                                  ],
                                ));
                          },
                        ),
                      ],
                    )
                  ]),
            ))
          ]),
        )
      ],
    );
  }
}
