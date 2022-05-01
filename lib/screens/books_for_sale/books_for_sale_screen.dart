// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_folder/components/book/book_card.dart';
import 'package:flutter_folder/components/coustom_bottom_nav_bar.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/enums.dart';
import 'package:flutter_folder/provider/book_model.dart';
import 'package:flutter_folder/screens/books_for_sale/components/filter_form.dart';
import 'package:provider/provider.dart';

class BooksForSaleScreen extends StatelessWidget {
  const BooksForSaleScreen({Key? key}) : super(key: key);

  OutlineInputBorder searchBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.transparent, width: 1),
    );
  }

  void _filter(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        isDismissible: false,
        builder: (BuildContext context) {
          return const FilterForm();
        });
  }

  Widget _stickySearch(BuildContext context) {
    return Positioned(
        bottom: 8,
        right: 16,
        child: Container(
          height: 38,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          width: MediaQuery.of(context).size.width,
          child: Row(children: [
            Expanded(
                child: TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        border: searchBorder(),
                        focusedBorder: searchBorder(),
                        enabledBorder: searchBorder(),
                        hintText: "Search book",
                        hintStyle: const TextStyle(
                            color: AppColors.kTextGrey, fontSize: 14),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: AppColors.kTextGrey,
                        )))),
            const SizedBox(
              width: 8,
            ),
            SizedBox(
              width: 38,
              child: Expanded(
                child: FlatButton(
                    onPressed: () => _filter(context),
                    color: AppColors.kPrimary,
                    height: 38,
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
        bottomNavigationBar:
            const CustomBottomNavBar(selectedMenu: MenuState.home),
        body: SafeArea(
            child: Column(
          children: [
            Container(
              child: _stickySearch(context),
            ),
            Expanded(
                child: Container(
                    padding: const EdgeInsets.only(top: 16),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Consumer<BookModel>(
                          builder: (context, value, child) => Wrap(
                              spacing: 24,
                              // TODO: Implement load more and hot reload
                              children: List.generate(
                                  value.listBestSelling.length,
                                  (index) => Container(
                                        padding:
                                            const EdgeInsets.only(bottom: 16),
                                        child: BookCard(
                                            book: value.listBestSelling[index]),
                                      )))),
                    )))
          ],
        )));
  }
}
