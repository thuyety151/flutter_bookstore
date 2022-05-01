import 'package:flutter/material.dart';

import '../../../components/custom_text_style.dart';

class CheckoutDelivery extends StatelessWidget {
  const CheckoutDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        decoration:const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          //color: Colors.tealAccent.withOpacity(0.2),
        ),
        margin:const EdgeInsets.all(4),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Radio(
            value: 1,
            groupValue: 1,
            onChanged: (isChecked) {},
            activeColor: Colors.tealAccent.shade400,
          ),
          Text(
            "Giao hang nhanh",
            style: CustomTextStyle.textFormFieldMedium.copyWith(
                color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Radio(
              value: 1,
              groupValue: 1,
              onChanged: (isChecked) {},
              activeColor: Colors.tealAccent.shade400,
            ),
            Text(
              "Shopee Express",
              style: CustomTextStyle.textFormFieldMedium.copyWith(
                  color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ]),
        ]),
      ),
    );
  }
}
