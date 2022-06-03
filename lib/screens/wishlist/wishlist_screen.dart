// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_folder/components/coustom_bottom_nav_bar.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/configs/constants.dart';
import 'package:flutter_folder/enums.dart';
import 'package:flutter_folder/helpers/show_dialog.dart';
import 'package:flutter_folder/provider/wishlist_provider.dart';
import 'package:flutter_folder/screens/manage_order/components/manage_order_item.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  void removeItem(BuildContext context, String id) {
    Provider.of<WishlistProvider>(context, listen: false)
        .deleteItem(id, () {}, () {});
  }

  Future<void> fetch(BuildContext context) async {
    Future.delayed(Duration.zero, () {
      showLoading(context);
    });
    var data =
        await Provider.of<WishlistProvider>(context, listen: false).getList();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar("Wishlist", 0, Colors.white, true),
        backgroundColor: AppColors.kBgGgrey,
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        bottomNavigationBar: const CustomBottomNavBar(
          selectedMenu: MenuState.favourite,
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 86),
            child: FutureBuilder(
                future: fetch(context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container();
                  } else {
                    if (snapshot.error == null) {
                      Navigator.pop(context);
                    }
                    return Consumer<WishlistProvider>(
                      builder: ((context, value, child) => value
                              .listWishlist.isEmpty
                          ? Center(
                              child: SizedBox(
                              height: 300,
                              child: Image.asset(
                                "assets/images/empty_result.png",
                              ),
                            ))
                          : (Column(
                              children: List.generate(
                              value.listWishlist.length,
                              (index) => Dismissible(
                                  onDismissed: (direction) => removeItem(
                                      context,
                                      value.listWishlist[index].id ?? ""),
                                  background: Container(
                                      margin: EdgeInsets.only(top: 16),
                                      color: Colors.red,
                                      alignment: Alignment.centerRight,
                                      child: FlatButton(
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {},
                                      )),
                                  key: Key("wish-list-item$index"),
                                  child: ManageOrderItem(
                                      isWishlistItem: true,
                                      checkoutItem: value.listWishlist[index])),
                            )))),
                    );
                  }
                })));
  }
}
