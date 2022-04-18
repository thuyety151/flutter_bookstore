import 'package:flutter/material.dart';

import '../../../components/custom_text_style.dart';

class CheckoutDelivery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        border: Border.all(color: Colors.tealAccent.withOpacity(0.4), width: 1),
        color: Colors.tealAccent.withOpacity(0.2),
      ),
      margin: EdgeInsets.all(4),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Radio(
          value: 1,
          groupValue: 1,
          onChanged: (isChecked) {},
          activeColor: Colors.tealAccent.shade400,
        ),
        Text(
          "Bay",
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
            "Di bo",
            style: CustomTextStyle.textFormFieldMedium.copyWith(
                color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ]),
      ]),
    );
  }
}
