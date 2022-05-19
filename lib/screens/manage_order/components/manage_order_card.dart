// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_folder/components/custom_text_style.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/helpers/error_handler.dart';
import 'package:flutter_folder/helpers/format.dart';
import 'package:flutter_folder/models/order.dart';
import 'package:flutter_folder/provider/order.dart' as provider;
import 'package:flutter_folder/screens/manage_order/components/manage_order_list_item.dart';
import 'package:provider/provider.dart';

class ManageOrderCard extends StatefulWidget {
  const ManageOrderCard({Key? key, required this.value}) : super(key: key);
  final Order value;
  @override
  _ManageOrderCardState createState() => _ManageOrderCardState();
}

class _ManageOrderCardState extends State<ManageOrderCard> {
  late bool loading = false;

  void cancelOrder() {
    setState(() {
      loading = true;
      Provider.of<provider.Order>(context, listen: false)
          .cancelOrder(widget.value.orderCode, (error) {
        catchErrAndNotify(
            AlertDialogParams(
                title: "Cancel order failed", content: error.toString()),
            "");
      });
    });
  }

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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 55 / 100,
                    child: Text(
                      format(DateTime.parse(widget.value.orderDate)),
                      style: CustomTextStyle.textFormFieldMedium
                          .copyWith(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 28 / 100,
                    child: Text(
                      "Order #${widget.value.orderCode}",
                      style: CustomTextStyle.textFormFieldBold
                          .copyWith(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ManageOrderListItem(
                items: widget.value.items,
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                height: 0.5,
                margin: const EdgeInsets.symmetric(vertical: 4),
                color: Colors.grey.shade400,
              ),
              Row(
                children: [
                  if (widget.value.status != "Cancel") ...[
                    RaisedButton(
                      onPressed: cancelOrder,
                      child: const Text(
                        "Cancle Order",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: AppColors.kPrimary,
                    ),
                  ],
                  const Spacer(),
                  Text(
                    "\$${widget.value.total}",
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
