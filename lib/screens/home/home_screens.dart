import 'package:flutter/material.dart';
import 'package:flutter_folder/components/coustom_bottom_nav_bar.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/enums.dart';
import 'package:flutter_folder/mocks/models/best_selling.dart';
import 'package:flutter_folder/screens/coupon/components/coupons_homepage.dart';
import 'package:flutter_folder/screens/home/components/authors.dart';
import 'package:flutter_folder/screens/home/components/bestselling.dart';
import 'package:flutter_folder/screens/home/components/deal_of_week.dart';
import 'package:flutter_folder/screens/home/components/home_page_header.dart';
import 'package:flutter_folder/screens/home/components/new_release.dart';

List<String> categories = ["Paperback", "Hardcover", "Kindlebook"];

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  final List<BestSellingModel> bestselling = listBestselling;

  Widget _body() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CouponHomepage(),
                BestSelling(),
                DealOfWeek(),
                NewRelease(),
                Authors()
              ]),
        ));
  }

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.kBgGgrey,
        bottomNavigationBar: const CustomBottomNavBar(
          selectedMenu: MenuState.home,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [const HomePageHeader(), _body()])),
        )));
  }
}
