import 'package:flutter/material.dart';

import '../../../components/custom_text_style.dart';

class CheckoutPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border:
              Border.all(color: Colors.orange.withOpacity(0.4), width: 1),
          color: Colors.orange.withOpacity(0.2),
          ),
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Radio(
              value: 1,
              groupValue: 1,
              onChanged: (isChecked) {},
              activeColor: Colors.tealAccent.shade400,
            ),
            Text(
              "Cash on delivery",
              style: CustomTextStyle.textFormFieldMedium.copyWith(
                  color: Colors.black, fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Radio(
              value: 1,
              groupValue: 1,
              onChanged: (isChecked) {},
              activeColor: Colors.tealAccent.shade400,
            ),
            Text(
              "MoMo",
              style: CustomTextStyle.textFormFieldMedium.copyWith(
                  color: Colors.black, fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ]),
        ],
      ),
    );
  }
}
