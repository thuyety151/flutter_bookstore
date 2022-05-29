import 'package:flutter/material.dart';
import 'package:flutter_folder/provider/order.dart';
import 'package:provider/provider.dart';

import 'manage_order_card.dart';

class ManageOrderListCard extends StatelessWidget {
  const ManageOrderListCard({Key? key, required this.status}) : super(key: key);
  final String status;

  @override
  Widget build(BuildContext context) {
    Provider.of<Order>(context, listen: false).getListOrders(status);

    return Consumer<Order>(
        builder: (context, value, child) => ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ManageOrderCard(value: value.listOrder.elementAt(index)),
              ),
              itemCount: value.listOrder.length,
            ));
  }
}
