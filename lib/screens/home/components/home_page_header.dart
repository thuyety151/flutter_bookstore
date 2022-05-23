// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_folder/components/category/category_circle.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/provider/category_model.dart';
import 'package:flutter_folder/screens/home/components/app_banner.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../../../components/badge.dart';
import '../../../provider/account_model.dart';
import '../../../provider/cart.dart';
import '../../../routes/index.dart';

class HomePageHeader extends StatefulWidget {
  const HomePageHeader({Key? key}) : super(key: key);

  @override
  State<HomePageHeader> createState() => _HomePageHeaderState();
}

class _HomePageHeaderState extends State<HomePageHeader> {
  var _isInit = true;
  var _isLoading = false;
  var _isLogin = false;
  static const storage = FlutterSecureStorage();
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _isLogin = Provider.of<AccountModel>(context).getisUserLogedIn();
    if (_isInit && _isLogin) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<Cart>(context).fetchAndSetCart().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

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
        width: MediaQuery.of(context).size.width * 92 / 100 - 2 * 16,
        margin: const EdgeInsets.only(left: 8),
        padding: const EdgeInsets.only(left: 8),
        child: TextField(
            decoration: InputDecoration(
                fillColor: Colors.white,
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
          Stack(
            children: [
              const Positioned(
                child: AppBanner(),
              ),
              Positioned(
                top: 8,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _search(),
                    _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Consumer<Cart>(
                            builder: (_, cart, ch) => Badge(
                              child: ch!,
                              value: cart.itemCount.toString(),
                            ),
                            child: FlatButton(
                              onPressed: () {
                                _isLogin
                                    ? Navigator.of(context)
                                        .pushNamed(RouteManager.ROUTE_CART)
                                    : Navigator.of(context)
                                        .pushNamed(RouteManager.ROUTE_LOGIN);
                              },
                              color: Colors.white,
                              height: 38,
                              minWidth: 38,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: const Image(
                                image: AssetImage(
                                  "assets/icons/o-icon-cart.png",
                                ),
                                height: 24,
                                width: 24,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
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
