// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_folder/components/custom_text_style.dart';
import 'package:flutter_folder/screens/manage_order/components/manage_order_list_item.dart';

class ManageOrderCard extends StatelessWidget {
  const ManageOrderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Card(
          elevation: 1,
          child: Container(
            padding: const EdgeInsets.all(15),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Thu, 20 April, 2022",
                    style: CustomTextStyle.textFormFieldMedium
                        .copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Order #12345",
                    style: CustomTextStyle.textFormFieldBold
                        .copyWith(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const ManageOrderListItem(),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                height: 0.5,
                margin: const EdgeInsets.symmetric(vertical: 4),
                color: Colors.grey.shade400,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    onPressed: () {},
                    child:const Text("Cancle Order"),
                    color: Colors.green,
                  ),
                  const Spacer(),
                  Text(
                    "\$248",
                    style: CustomTextStyle.textFormFieldSemiBold
                        .copyWith(fontSize: 20, color: Colors.red),
                  ),
                ],
              ),
            ]),
          )),
    );
  }
}
