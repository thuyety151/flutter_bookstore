import 'package:flutter/material.dart';

import '../../../components/custom_text_style.dart';

class CheckoutPriceSection extends StatelessWidget {
  const CheckoutPriceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(4),
      decoration:const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Card(
        elevation: 0,
        shape:const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Container(
          decoration: BoxDecoration(
              borderRadius:const BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: Colors.grey.shade200)),
          padding:const EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
             
              createPriceItem("Sub total", "\$22.58",
                  Colors.grey.shade700),
              createPriceItem("Shipping", "\$6.74",
                  Colors.teal.shade300),
              createPriceItem(
                  "Discount", "-5", Colors.red.shade300),
              const SizedBox(
                height: 8,
              ),
              Container(
                width: double.infinity,
                height: 0.5,
                margin:const EdgeInsets.symmetric(vertical: 4),
                color: Colors.grey.shade400,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Total",
                    style: CustomTextStyle.textFormFieldSemiBold
                        .copyWith(color: Colors.black, fontSize: 16),
                  ),
                  Text(
                    "\$29.32",
                    style: CustomTextStyle.textFormFieldSemiBold
                        .copyWith(color: Colors.black, fontSize: 16),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

createPriceItem(String key, String value, Color color) {
  return Container(
    padding:const EdgeInsets.symmetric(horizontal: 0, vertical: 3),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          key,
          style: CustomTextStyle.textFormFieldMedium
              .copyWith(color: Colors.grey.shade700, fontSize: 14),
        ),
        Text(
          value,
          style: CustomTextStyle.textFormFieldMedium
              .copyWith(color: color, fontSize: 14),
        )
      ],
    ),
  );
}
