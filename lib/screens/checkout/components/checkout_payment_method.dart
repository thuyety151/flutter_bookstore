import 'package:flutter/material.dart';

import '../../../components/custom_text_style.dart';

class CheckoutPayment extends StatefulWidget {
  const CheckoutPayment(
      {Key? key,
      this.districtId,
      this.onChangePaymentMethod,
      required this.isSelectedMoMo})
      : super(key: key);
  final districtId;
  final onChangePaymentMethod;
  final bool isSelectedMoMo;

  @override
  State<CheckoutPayment> createState() => _CheckoutPaymentState();
}

class _CheckoutPaymentState extends State<CheckoutPayment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(color: Colors.white, width: 1),
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Radio(
             value: widget.isSelectedMoMo ? 0 : 1,
              groupValue: 1,
              onChanged: (isChecked) {
                widget.onChangePaymentMethod(false);
              },
              activeColor: Colors.orange.shade400,
            ),
            Text(
              'Cash on delivery',
              style: CustomTextStyle.textFormFieldMedium.copyWith(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Radio(
              value: widget.isSelectedMoMo ? 1 : 0,
              groupValue: 1,
              onChanged: (isChecked) {
                widget.onChangePaymentMethod(true);
              },
              activeColor: Colors.orange.shade400,
            ),
            Text(
              "Payment with MoMo",
              style: CustomTextStyle.textFormFieldMedium.copyWith(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ]),
        ],
      ),
    );
  }
}
