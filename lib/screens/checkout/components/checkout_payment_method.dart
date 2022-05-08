import 'package:flutter/material.dart';

import '../../../components/custom_text_style.dart';

class CheckoutPayment extends StatelessWidget {
  const CheckoutPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius:const BorderRadius.all(Radius.circular(4)),
          border:
              Border.all(color: Colors.white, width: 1),
          color: Colors.white,
          ),
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Radio(
              value: 1,
              groupValue: 1,
              onChanged: (isChecked) {},
              activeColor: Colors.orange.shade400,
            ),
            Text(
              "Cash on delivery",
              style: CustomTextStyle.textFormFieldMedium.copyWith(
                  color: Colors.black, fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Radio(
              value: 0,
              groupValue: 1,
              onChanged: (isChecked) {},
              activeColor: Colors.orange.shade400,
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
