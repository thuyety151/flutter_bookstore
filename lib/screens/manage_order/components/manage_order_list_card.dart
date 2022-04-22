import 'package:flutter/material.dart';

import 'manage_order_card.dart';

class ManageOrderListCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: ManageOrderCard(),
      ),
      itemCount: 4,
    );
  }
}
