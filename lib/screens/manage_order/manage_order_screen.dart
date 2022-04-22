import 'package:flutter/material.dart';
import 'package:flutter_folder/screens/manage_order/components/manage_order_item.dart';
import 'package:flutter_folder/screens/manage_order/components/manage_order_list_item.dart';

import 'components/manage_order_list_card.dart';

class ManageOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("My Order"),
            bottom: TabBar(
              indicator: BoxDecoration(borderRadius: BorderRadius.circular(10),
              color: Colors.pink),
              tabs: [
              Tab(
                text: "Ready to pick",
              ),
              Tab(text: "Complete"),
              Tab(text: "Cancel"),
            ]),
          ),
          body: TabBarView(children: [
            ManageOrderListCard(),
            ManageOrderListCard(),
            ManageOrderListCard(),
          ]),
        ));
  }
}
