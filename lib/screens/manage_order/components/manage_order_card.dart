// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_folder/components/custom_text_style.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/configs/constants.dart';
import 'package:flutter_folder/helpers/error_handler.dart';
import 'package:flutter_folder/helpers/format.dart';
import 'package:flutter_folder/models/order.dart';
import 'package:flutter_folder/provider/order.dart' as provider;
import 'package:flutter_folder/routes/index.dart';
import 'package:flutter_folder/screens/manage_order/components/manage_order_list_item.dart';
import 'package:flutter_folder/screens/review/review_screen.dart';
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

  void review() {
    Navigator.of(context).pushNamed(RouteManager.ROUTE_REVIEW,
        arguments: ReviewArgs(id: widget.value.id));
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.value.items.length} item${widget.value.items.length > 1 ? "s" : ""}",
                      style: AppTextStyles.caption,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Total : ",
                          style: AppTextStyles.caption,
                        ),
                        Text(
                          "\$${widget.value.total.toStringAsFixed(2)}",
                          style: CustomTextStyle.textFormFieldSemiBold
                              .copyWith(fontSize: 20, color: Colors.red),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 0.5,
                margin: const EdgeInsets.symmetric(vertical: 4),
                color: Colors.grey.shade400,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  if (widget.value.status != "Cancel") ...[
                    Expanded(
                      child: OutlinedButton(
                        onPressed: cancelOrder,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: const Text(
                            "Cancel Order",
                            style: TextStyle(color: AppColors.kPrimary),
                          ),
                        ),
                        style: OutlinedButton.styleFrom(),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: review,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: const Text(
                            "Review",
                            style: TextStyle(color: AppColors.kPrimary),
                          ),
                        ),
                        style: OutlinedButton.styleFrom(),
                      ),
                    )
                  ],
                ],
              ),
            ]),
          )),
    );
  }
}
