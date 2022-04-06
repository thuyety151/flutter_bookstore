import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_folder/components/book/book_card.dart';
import 'package:flutter_folder/components/book/deal_of_week.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/mocks/models/Author.dart';
import 'package:flutter_folder/mocks/models/BestSelling.dart';
import 'package:flutter_folder/routes/index.dart';
import 'package:flutter_folder/screens/home/components/home_page_header.dart';

List<String> categories = ["Paperback", "Hardcover", "Kindlebook"];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<BestSellingModel> bestselling = listBestselling;

  void onViewDetail() {
    Navigator.of(context).pushNamed(RouteManager.ROUTE_PRODUCT_DETAIL);
  }

  Widget _title(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 16, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Image(
            image: AssetImage("assets/icons/icon-view-all.png"),
          )
        ],
      ),
    );
  }

  Widget _section(String title, Widget child, double height) {
    // need to improve to dynamic height, fit content
    return Column(
      children: [
        _title(title),
        SizedBox(
            child: Container(
                height: height,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal, child: child))),
      ],
    );
  }

  Widget _newReCategories() {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 4,
      children: List.generate(
          categories.length,
          (index) => Container(
                  child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: BorderSide(
                        width: 1.0,
                        color:
                            index == 0 ? AppColors.kPrimary : Colors.black38),
                    backgroundColor:
                        index == 0 ? AppColors.kBgPrimary : Colors.white),
                onPressed: () {},
                child: Text(
                  categories[index],
                  style: TextStyle(
                      color: index == 0
                          ? AppColors.kPrimary
                          : AppColors.kTextGrey),
                ),
              ))),
    );
  }

  Widget _body() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _section(
              "Best selling",
              Wrap(
                spacing: 12,
                children: List.generate(listBestselling.length,
                    (index) => BookCard(book: listBestselling[index])),
              ),
              300,
            ),
            _section(
              "Deals of week",
              Wrap(
                  spacing: 12,
                  children: List.generate(3, (index) => DealOfWeekCard())),
              128,
            ),
            _title("New release"),
            _newReCategories(),
            SizedBox(
              height: 12,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                  spacing: 12,
                  children: List.generate(
                      3, (index) => BookCard(book: newRelease[index]))),
            ),
            _section(
              "Authors",
              Wrap(
                spacing: 12,
                children: List.generate(
                    authors.length,
                    (index) => Container(
                          height: 100,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Column(children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              child: Image(
                                image: NetworkImage(authors[index].imgUrl),
                                height: 50,
                                width: 50,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              authors[index].name,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            )
                          ]),
                        )),
              ),
              300,
            ),
          ]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.kBgGgrey,
        // bottomNavigationBar: AppBottomNavigationBar(),
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
