import 'package:flutter/material.dart';
import 'package:flutter_folder/components/book/book_card.dart';
import 'package:flutter_folder/components/book/deal_of_week.dart';
import 'package:flutter_folder/components/coustom_bottom_nav_bar.dart';
import 'package:flutter_folder/components/list_book_section.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/enums.dart';
import 'package:flutter_folder/mocks/models/BestSelling.dart';
import 'package:flutter_folder/models/newrelease.dart';
import 'package:flutter_folder/provider/author_model.dart';
import 'package:flutter_folder/provider/book_model.dart';
import 'package:flutter_folder/routes/index.dart';
import 'package:flutter_folder/screens/home/components/home_page_header.dart';
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
    Provider.of<BookModel>(context, listen: false).getListNewRelease();
    Provider.of<BookModel>(context, listen: false)
        .getListBookForSale("deal-of-week");
    Provider.of<AuthorModel>(context, listen: false).getListAuthor();
  }

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
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1),
          ),
          Image(
            image: AssetImage("assets/icons/icon-view-all.png"),
          )
        ],
      ),
    );
  }

  Widget _section(String title, Widget child) {
    return Column(
      children: [
        _title(title),
        SizedBox(
            child: Container(
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal, child: child))),
      ],
    );
  }

  Widget _newReCategories(List<NewReleaseModel> model) {
    return Container(
        alignment: Alignment.topLeft,
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 8,
          children: List.generate(
              model.length,
              (index) => Container(
                      child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            width: 1.0,
                            color: index == 0
                                ? AppColors.kPrimary
                                : Colors.black38),
                        backgroundColor:
                            index == 0 ? AppColors.kPrimary : Colors.white),
                    onPressed: () {},
                    child: Text(
                      model[index].categoryName,
                      style: TextStyle(
                          color:
                              index == 0 ? Colors.white : AppColors.kTextGrey),
                    ),
                  ))),
        ));
  }

  Widget _newRelease(BuildContext _context) {
    return Consumer<BookModel>(
        builder: (context, value, child) => ListBookSession(
              title: "New release",
              header: Column(children: [
                _newReCategories(value.listNewRelease),
                SizedBox(
                  height: 12,
                ),
              ]),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                    spacing: 12,
                    children: value.listNewRelease.isNotEmpty
                        ? List.generate(
                            value.listNewRelease[0].books.length,
                            (index) => BookCard(
                                book: value.listNewRelease[0].books[index]))
                        : []),
              ),
            ));
  }

  Widget _body() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ListBookSession(
              title: "Best selling",
              child: Consumer<BookModel>(
                  builder: ((context, value, child) => Wrap(
                        spacing: 12,
                        children: List.generate(
                            value.listBestSelling.length,
                            (index) =>
                                BookCard(book: value.listBestSelling[index])),
                      ))),
            ),
            ListBookSession(
              title: "Deals of week",
              child: Consumer<BookModel>(
                  builder: (context, value, child) => Wrap(
                      spacing: 12,
                      children: List.generate(
                          value.listDeal.length,
                          (index) => DealOfWeekCard(
                                model: value.listDeal[index],
                              )))),
            ),
            _newRelease(context),
            ListBookSession(
              title: "Authors",
              child: Consumer<AuthorModel>(
                  builder: (context, value, child) => Wrap(
                        spacing: 12,
                        children: List.generate(
                            value.listAuthor.length,
                            (index) => Container(
                                  height: 100,
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Column(children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      child: Image(
                                        image: NetworkImage(
                                            value.listAuthor[index].imageUrl),
                                        height: 50,
                                        width: 50,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      value.listAuthor[index].name,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ]),
                                )),
                      )),
            ),
          ]),
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
