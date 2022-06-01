// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_folder/components/book/book_card.dart';
import 'package:flutter_folder/components/coustom_bottom_nav_bar.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/configs/constants.dart';
import 'package:flutter_folder/enums.dart';
import 'package:flutter_folder/models/filter.dart';
import 'package:flutter_folder/provider/book_model.dart';
import 'package:flutter_folder/screens/books_for_sale/components/empty_result.dart';
import 'package:flutter_folder/screens/books_for_sale/components/filter_form.dart';
import 'package:flutter_folder/screens/books_for_sale/components/search.dart';
import 'package:provider/provider.dart';

class BFSArguments {
  String? categoryId;
  String? authorId;
  bool? isSeaching;

  BFSArguments({this.categoryId, this.authorId, this.isSeaching});
}

class BooksForSaleScreen extends StatefulWidget {
  const BooksForSaleScreen({Key? key}) : super(key: key);

  @override
  State<BooksForSaleScreen> createState() => _BooksForSaleScreenState();
}

class _BooksForSaleScreenState extends State<BooksForSaleScreen> {
  var _isInit = true;
  var _isLoading = false;
  var scrollcontroller = ScrollController();
  late Filter formValue;

  @override
  void initState() {
    scrollcontroller.addListener(_scrollListener);
    super.initState();
    formValue = Provider.of<BookModel>(context, listen: false).filterData;
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final argsCate = ModalRoute.of(context)!.settings.arguments as dynamic;
      Provider.of<BookModel>(context, listen: false)
          .setInit(argsCate?.categoryId, argsCate?.authorId);

      setState(() {
        _isLoading = true;
      });
      Provider.of<BookModel>(context, listen: false)
          .fetchAndSetBooks()
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _scrollListener() {
    if (scrollcontroller.position.extentAfter < 300) {
      formValue.pageIndex += 1;
      Provider.of<BookModel>(context, listen: false).setFilterData(formValue);
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar("Books for sale", 0, Colors.white, true),
        backgroundColor: AppColors.kBgGgrey,
        bottomNavigationBar:
            const CustomBottomNavBar(selectedMenu: MenuState.home),
        body: Column(
          children: [
            Search(
              setKeywords: (value) {
                Provider.of<BookModel>(context, listen: false)
                    .setKeyword(value);
              },
              btnFilter: SizedBox(
                width: 48,
                child: Expanded(
                  child: FlatButton(
                      onPressed: () => _filter(context),
                      color: Colors.white,
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: const Image(
                        image: AssetImage(
                          "assets/icons/icon-filter-outline.png",
                        ),
                        height: 20,
                        width: 20,
                        fit: BoxFit.fill,
                      )),
                ),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                height: 600,
                padding: const EdgeInsets.only(top: 16),
                child: Consumer<BookModel>(
                    builder: (context, value, child) => value.books.isNotEmpty
                        ? Scrollbar(
                            child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            controller: scrollcontroller,
                            itemBuilder: (context, index) {
                              if (index % 2 == 0) {
                                return const SizedBox();
                              }
                              return Wrap(
                                direction: Axis.horizontal,
                                spacing: 16,
                                children: [
                                  Container(
                                    width: (MediaQuery.of(context).size.width -
                                            3 * 16) *
                                        50 /
                                        100,
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: BookCard(book: value.books[index]),
                                  ),
                                  if (index + 1 < value.books.length - 1) ...[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          44 /
                                          100,
                                      padding:
                                          const EdgeInsets.only(bottom: 16),
                                      child: BookCard(
                                          book: value.books[index + 1]),
                                    )
                                  ]
                                ],
                              );
                            },
                            itemCount: value.books.length,
                          ))
                        : const EmptyResult()),
              ),
            ))
          ],
        ));
  }
}
