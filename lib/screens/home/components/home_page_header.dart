// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_folder/components/category/category_circle.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/provider/cart_model.dart';
import 'package:flutter_folder/provider/category_model.dart';
import 'package:flutter_folder/screens/home/components/app_banner.dart';
import 'package:provider/provider.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({Key? key}) : super(key: key);

  Widget _listCategory() {
    return Scrollbar(
        //isAlwaysShown: true,
        child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Consumer<CategoryModel>(
          builder: (context, value, child) => Row(
              children: List.generate(
                  value.categoryHomescreen.length,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: CardCategoryCircle(
                          category: value.categoryHomescreen[index],
                        ),
                      )))),
    ));
  }

  OutlineInputBorder searchBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.transparent, width: 1),
    );
  }

  Widget _search() {
    return Container(
        height: 38,
        width: 300,
        padding: const EdgeInsets.only(left: 8),
        child: TextField(
            decoration: InputDecoration(
                fillColor: AppColors.kBgGgrey,
                filled: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                border: searchBorder(),
                focusedBorder: searchBorder(),
                enabledBorder: searchBorder(),
                hintText: "Search book",
                hintStyle:
                    const TextStyle(color: AppColors.kTextGrey, fontSize: 14),
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.kTextGrey,
                ))));
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<CategoryModel>(context, listen: false)
        .getCategoriesHomescreen();

    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          color: Colors.white),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _search(),
              FlatButton(
                onPressed: () {
                  Provider.of<CartModel>(context, listen: false).getCart();
                  // Navigator.of(context).pushNamed(RouteManager.ROUTE_CART);
                },
                color: AppColors.kPrimary,
                height: 30,
                minWidth: 30,
                padding: const EdgeInsets.symmetric(horizontal: 0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: const Image(
                  image: AssetImage(
                    "assets/icons/icon-add-cart.png",
                  ),
                  height: 24,
                  width: 24,
                  fit: BoxFit.fill,
                ),
              ),
              FlatButton(
                onPressed: () {},
                color: AppColors.kPrimary,
                height: 30,
                minWidth: 30,
                padding: const EdgeInsets.symmetric(horizontal: 0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: const Image(
                  image: AssetImage(
                    "assets/icons/icon-filter-2.png",
                  ),
                  height: 18,
                  width: 18,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          const AppBanner(),
          SizedBox(
            height: 100,
            child: SizedBox(child: _listCategory()),
          ),
          const SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}
