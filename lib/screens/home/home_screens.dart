import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_folder/components/book/book_card.dart';
import 'package:flutter_folder/components/book/deal_of_week.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/mocks/models/BestSelling.dart';
import 'package:flutter_folder/routes/index.dart';
import 'package:flutter_folder/screens/home/components/home_page_header.dart';

class AuthorTemp {
  String name;
  String imgUrl;
  AuthorTemp(this.name, this.imgUrl);
}

List<String> categories = ["Paperback", "Hardcover", "Kindlebook"];

List<AuthorTemp> authors = [
  AuthorTemp("Song Kang", "https://dbk.vn/uploads/news/images/song-kang-1.jpg"),
  AuthorTemp("Lâm Nhất",
      "https://kenh14cdn.com/2019/4/29/photo-1-1556515492908274470798.jpg"),
  AuthorTemp("Dew Jirawat",
      "https://photo-cms-anninhthudo.zadn.vn/w600/Uploaded/2022/lcjlcanwm/2022_03_12/anh-14-3011.jpg"),
  AuthorTemp("Bright",
      "https://ss-images.saostar.vn/wp700/2020/04/09/7310137/90001498_900482147052245_6436830738775015424_o.jpg")
];

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
          child: child,
          // child: ListView.separated(
          //     shrinkWrap: true,
          //     scrollDirection: Axis.horizontal,
          //     itemCount: 4,
          //     separatorBuilder: (context, index) => SizedBox(
          //           width: 10,
          //         ),
          //     itemBuilder: (_, index) =>
          //         BookCard(book: listBestselling[index])),
        )),
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
              ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  separatorBuilder: (context, index) => SizedBox(
                        width: 10,
                      ),
                  itemBuilder: (_, index) =>
                      BookCard(book: listBestselling[index])),
              300,
            ),
            _section(
              "Deals of week",
              ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                separatorBuilder: (context, index) => SizedBox(
                  width: 10,
                ),
                itemBuilder: (_, index) => DealOfWeekCard(),
              ),
              128,
            ),
            _title("New release"),
            _newReCategories(),
            SizedBox(
              height: 12,
            ),
            SizedBox(
                child: Container(
              height: 300,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  separatorBuilder: (context, index) => SizedBox(
                        width: 10,
                      ),
                  itemBuilder: (_, index) => BookCard(book: newRelease[index])),
            )),
            _section(
              "Authors",
              ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  separatorBuilder: (context, index) => SizedBox(
                        width: 10,
                      ),
                  itemBuilder: (_, index) => Container(
                        height: 100,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Column(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
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
