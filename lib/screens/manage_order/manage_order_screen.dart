import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'components/manage_order_list_card.dart';

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
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.pink),
                tabs: const [
                  Tab(
                    text: "Ready to pick",
                  ),
                  Tab(text: "Complete"),
                  Tab(text: "Cancel"),
                ]),
          ),
          body: const TabBarView(children: [
            ManageOrderListCard(),
            ManageOrderListCard(),
            ManageOrderListCard(),
          ]),
        ));
  }
}
