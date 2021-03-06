import 'package:flutter/material.dart';

import '../../../components/custom_text_style.dart';
import '../../../models/item.dart';

class CheckoutItem extends StatelessWidget {
  const CheckoutItem({Key? key, required this.checkoutItem}) : super(key: key);

  final Item checkoutItem;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin:const EdgeInsets.only(left: 16, right: 16, top: 16),
          decoration:const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(
                16,
              ))),
          child: Row(children: [
            Container(
              margin:const EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
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
                      checkoutItem.attributeName ?? "",
                      style: CustomTextStyle.textFormFieldRegular
                          .copyWith(color: Colors.grey, fontSize: 14),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$ " + checkoutItem.price.toString(),
                          style: CustomTextStyle.textFormFieldBlack
                              .copyWith(color: Colors.red),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                
                                Container(
                                  color: Colors.grey.shade200,
                                  padding: const EdgeInsets.only(
                                      top: 5, bottom: 3, right: 12, left: 12),
                                  child: Text(
                                    "x ${checkoutItem.quantity}",
                                    style:
                                        CustomTextStyle.textFormFieldSemiBold,
                                  ),
                                ),
                              ],
                            ))
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
