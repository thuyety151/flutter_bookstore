import 'package:flutter/material.dart';

import 'manage_order_card.dart';

class ManageOrderListCard extends StatelessWidget {
  const ManageOrderListCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: ManageOrderCard(),
      ),
      itemCount: 4,
    );
  }
}
