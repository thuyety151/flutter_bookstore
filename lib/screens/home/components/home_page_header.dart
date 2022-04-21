import 'package:flutter/material.dart';
import 'package:flutter_folder/components/category/category_circle.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/mocks/models/Category.dart';
import 'package:flutter_folder/provider/category_model.dart';
import 'package:flutter_folder/screens/home/components/app_banner.dart';
import 'package:provider/provider.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({Key? key}) : super(key: key);

  Widget _listCategory(BuildContext context) {
    return Scrollbar(
        isAlwaysShown: true,
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Consumer<CategoryModel>(
              builder: (context, value, child) => Row(
                  children: List.generate(
                      value.categoryHomescreen.length,
                      (index) => Padding(
                            padding: EdgeInsets.all(8),
                            child: CardCategoryCircle(
                              category: value.categoryHomescreen[index],
                            ),
                          ))),
            )));
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
        width: 360,
        padding: EdgeInsets.only(left: 8),
        child: TextField(
            decoration: InputDecoration(
                fillColor: AppColors.kBgGgrey,
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                border: searchBorder(),
                focusedBorder: searchBorder(),
                enabledBorder: searchBorder(),
                hintText: "Search book",
                hintStyle: TextStyle(color: AppColors.kTextGrey, fontSize: 14),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.kTextGrey,
                ))));
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<CategoryModel>(context, listen: false)
        .getCategoriesHomescreen();

    return Container(
      decoration: BoxDecoration(
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
                  onPressed: () {},
                  color: AppColors.kPrimary,
                  height: 38,
                  minWidth: 38,
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Image(
                    image: AssetImage(
                      "assets/icons/icon-filter-2.png",
                    ),
                    height: 18,
                    width: 18,
                    fit: BoxFit.fill,
                  )),
            ],
          ),
          AppBanner(),
          Container(
            height: 100,
            child: SizedBox(child: _listCategory(context)),
          ),
          SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}
