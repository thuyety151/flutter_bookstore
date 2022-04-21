import 'package:flutter/material.dart';
import 'package:flutter_folder/components/coustom_bottom_nav_bar.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/enums.dart';
import 'package:flutter_folder/mocks/models/BestSelling.dart';
import 'package:flutter_folder/models/newrelease.dart';
import 'package:flutter_folder/provider/book_model.dart';
import 'package:flutter_folder/routes/index.dart';
import 'package:flutter_folder/screens/home/components/authors.dart';
import 'package:flutter_folder/screens/home/components/bestselling.dart';
import 'package:flutter_folder/screens/home/components/deal_of_week.dart';
import 'package:flutter_folder/screens/home/components/home_page_header.dart';
import 'package:flutter_folder/screens/home/components/new_release.dart';
import 'package:provider/provider.dart';

List<String> categories = ["Paperback", "Hardcover", "Kindlebook"];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final List<BestSellingModel> bestselling = listBestselling;

  void onViewDetail() {
    Navigator.of(context).pushNamed(RouteManager.ROUTE_PRODUCT_DETAIL);
  }

  Widget _body() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [BestSelling(), DealOfWeek(), NewRelease(), Authors()]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<BookModel>(context, listen: false).getListBestSelling();

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.kBgGgrey,
        bottomNavigationBar: CustomBottomNavBar(
          selectedMenu: MenuState.home,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [HomePageHeader(), _body()]))),
        )));
  }
}
