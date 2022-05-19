import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/provider/order.dart';
import 'package:provider/provider.dart';
import 'components/manage_order_list_card.dart';

// ignore: non_constant_identifier_names
List<String> TabValues = ["Ready To Pick", "Complete", "Cancel"];

class ManageOrderScreen extends StatelessWidget {
  const ManageOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: AppColors.kGrey,
            title: const Text(
              "My Order",
              style: TextStyle(color: AppColors.kGrey),
            ),
            centerTitle: true,
            bottom: TabBar(
                onTap: (index) => Provider.of<Order>(context, listen: false)
                    .getListOrders(TabValues[index]),
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.kBgPrimary),
                labelColor: AppColors.kPrimary,
                tabs: const [
                  Tab(text: "Ready to pick"),
                  Tab(text: "Complete"),
                  Tab(text: "Cancel"),
                ]),
          ),
          body: TabBarView(
              children: TabValues.map((e) => ManageOrderListCard(
                    status: e,
                  )).toList()
              //  ,
              //   ManageOrderListCard(status: "Cancel"),
              //   ManageOrderListCard(
              //     status: "",
              //   ),
              ),
        ));
  }
}
