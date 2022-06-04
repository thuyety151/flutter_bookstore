import 'package:flutter/material.dart';
import 'package:flutter_folder/models/item.dart';
import 'package:flutter_folder/provider/wishlist_provider.dart';
import 'package:flutter_folder/routes/index.dart';
import 'package:flutter_folder/screens/book_detail/book_detail_screen.dart';
import 'package:provider/provider.dart';

import '../../../components/custom_text_style.dart';

class ManageOrderItem extends StatelessWidget {
  const ManageOrderItem(
      {Key? key, required this.checkoutItem, this.isWishlistItem})
      : super(key: key);

  final Item checkoutItem;
  final bool? isWishlistItem;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(
              RouteManager.ROUTE_PRODUCT_DETAIL,
              arguments: BookDetailArgs(id: checkoutItem.productId ?? "")),
          child: Container(
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
                      image: NetworkImage(checkoutItem.pictureUrl ?? ""),
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
                          checkoutItem.productName ?? "",
                          maxLines: 2,
                          softWrap: true,
                          style: CustomTextStyle.textFormFieldSemiBold
                              .copyWith(fontSize: 14),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "${checkoutItem.attributeName}",
                        style: CustomTextStyle.textFormFieldRegular
                            .copyWith(color: Colors.grey, fontSize: 14),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (isWishlistItem == false) ...[
                            Text(
                              "x${checkoutItem.quantity}",
                              style: CustomTextStyle.textFormFieldRegular
                                  .copyWith(color: Colors.grey),
                            )
                          ],
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "\$ " +
                                        checkoutItem.price!.toStringAsFixed(2),
                                    style:
                                        CustomTextStyle.textFormFieldSemiBold,
                                  ),
                                ],
                              )),
                          if (isWishlistItem == true) ...[
                            IconButton(
                              onPressed: () {
                                Provider.of<WishlistProvider>(context,
                                        listen: false)
                                    .addToCart(checkoutItem.id, () {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content:
                                        Text("Add item to cart successfully!"),
                                    duration: Duration(seconds: 1),
                                  ));
                                }, () {});
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                              },
                              icon: const Image(
                                  image: AssetImage(
                                      "assets/icons/icon-cart-primary.png")),
                            ),
                          ]
                        ],
                      )
                    ]),
              ))
            ]),
          ),
        )
      ],
    );
  }
}
