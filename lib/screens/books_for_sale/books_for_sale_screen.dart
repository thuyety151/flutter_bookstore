import 'package:flutter/material.dart';
import 'package:flutter_folder/components/book/book_card.dart';
import 'package:flutter_folder/components/coustom_bottom_nav_bar.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/configs/constants.dart';
import 'package:flutter_folder/enums.dart';
import 'package:flutter_folder/mocks/models/BestSelling.dart';
import 'package:flutter_folder/screens/books_for_sale/components/filter_form.dart';

class BooksForSaleScreen extends StatelessWidget {
  const BooksForSaleScreen({Key? key}) : super(key: key);

  OutlineInputBorder searchBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.transparent, width: 1),
    );
  }

  Widget _filterHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FlatButton(
            onPressed: () {},
            child: Text(
              "Clear",
              style: TextStyle(fontSize: 12),
            )),
        Text(
          "Filters",
          style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 2),
        ),
        FlatButton(
            onPressed: () {},
            child: Text(
              "Save",
              style: TextStyle(fontSize: 12),
            )),
      ],
    );
  }

  void _filter(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
              decoration: showBottomSheetStyle(),
              child: Column(
                children: [
                  Container(
                    child: Column(children: [
                      _filterHeader(),
                      Divider(
                        thickness: 1,
                        color: Color.fromARGB(100, 158, 158, 158),
                      ),
                    ]),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Wrap(
                      children: [FilterForm()],
                    ),
                  ))
                ],
              ));
        });
  }

  Widget _stickySearch(BuildContext context) {
    return Positioned(
        bottom: 8,
        right: 16,
        child: Container(
          height: 38,
          padding: EdgeInsets.symmetric(horizontal: 8),
          width: MediaQuery.of(context).size.width,
          child: Row(children: [
            Expanded(
                child: TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        border: searchBorder(),
                        focusedBorder: searchBorder(),
                        enabledBorder: searchBorder(),
                        hintText: "Search book",
                        hintStyle:
                            TextStyle(color: AppColors.kTextGrey, fontSize: 14),
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.kTextGrey,
                        )))),
            SizedBox(
              width: 8,
            ),
            Container(
              width: 38,
              child: Expanded(
                child: FlatButton(
                    onPressed: () => _filter(context),
                    color: AppColors.kPrimary,
                    height: 38,
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
              ),
            )
          ]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kBgGgrey,
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
        body: SafeArea(
            child: Column(
          children: [
            Container(
              child: _stickySearch(context),
            ),
            Expanded(
                child: Container(
                    padding: EdgeInsets.only(top: 16),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Wrap(
                          spacing: 24,
                          // TODO: Implement load more and hot reload
                          children: List.generate(
                              newRelease.length,
                              (index) => Container(
                                    padding: EdgeInsets.only(bottom: 16),
                                    child: BookCard(book: newRelease[index]),
                                  ))),
                    )))
          ],
        )));
  }
}
