import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folder/helpers/show_dialog.dart';
import 'package:flutter_folder/provider/order.dart';
import 'package:provider/provider.dart';

import 'manage_order_card.dart';

class ManageOrderListCard extends StatelessWidget {
  const ManageOrderListCard({Key? key, required this.status}) : super(key: key);
  final String status;

  Future<void> fetch(BuildContext context) async {
    Future.delayed(Duration.zero, () {
      showLoading(context);
    });
    var data =
        await Provider.of<Order>(context, listen: false).getListOrders(status);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetch(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          } else {
            Navigator.pop(context);
            return Consumer<Order>(
                builder: (context, value, child) => value.listOrder.isEmpty
                    ? SizedBox(
                        height: 300,
                        child: Image.asset(
                          "assets/images/empty_result.png",
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ManageOrderCard(
                              value: value.listOrder.elementAt(index)),
                        ),
                        itemCount: value.listOrder.length,
                      ));
          }
        });
  }
}
