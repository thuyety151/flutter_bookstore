// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/configs/constants.dart';
import 'package:flutter_folder/provider/wishlist_provider.dart';
import 'package:flutter_folder/screens/manage_order/components/manage_order_item.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  void removeItem(BuildContext context, String id) {
    Provider.of<WishlistProvider>(context, listen: false)
        .deleteItem(id, () {}, () {});
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<WishlistProvider>(context, listen: false).getList();

    return Scaffold(
        appBar: customAppBar("Wishlist", 0, Colors.white),
        backgroundColor: AppColors.kBgGgrey,
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 86),
            child: Consumer<WishlistProvider>(
              builder: ((context, value, child) => (Column(
                      children: List.generate(
                    value.listWishlist.length,
                    (index) => Dismissible(
                        onDismissed: (direction) => removeItem(
                            context, value.listWishlist[index].id ?? ""),
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
            )));
  }
}
