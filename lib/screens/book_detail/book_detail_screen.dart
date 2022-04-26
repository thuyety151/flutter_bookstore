// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/provider/book_model.dart';
import 'package:flutter_folder/screens/book_detail/detail/components/book_detail_bottom.dart';
import 'package:flutter_folder/screens/book_detail/detail/components/book_list_image.dart';
import 'package:flutter_folder/screens/book_detail/review/components/session_title.dart';
import 'package:flutter_folder/screens/book_detail/review/review_container.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

List<String> attributeNames = ["Paperback", "Hardcover", "Kindle", "Audio"];

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({Key? key}) : super(key: key);

  Widget _tagCategory() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: Colors.pink[50]),
      child: const Text("Fiction"),
    );
  }

  Widget _shortDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SessionTitle(
          title: "Description",
          padding: EdgeInsets.only(top: 4, bottom: 10),
        ),
        const SizedBox(
          height: 4,
        ),
        Consumer<BookModel>(
          builder: (context, value, child) => ReadMoreText(
            value.detail?.description ?? "",
            trimLines: 2,
            colorClickableText: Colors.pink,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            moreStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.pink),
            style:const  TextStyle(color: Colors.black),
          ),
        )
      ],
    );
  }

  Widget _attributes() {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SessionTitle(
          title: "Attributes",
          padding: EdgeInsets.only(bottom: 8),
        ),
        Consumer<BookModel>(
          builder: (context, value, child) => Wrap(
            direction: Axis.horizontal,
            spacing: 4,
            children: List.generate(
                value.detail?.attributes?.length ?? 0,
                (index) => OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(
                              width: 1.0,
                              color: index == 0
                                  ? AppColors.kPrimary
                                  : Colors.black38),
                          backgroundColor:
                              index == 0 ? AppColors.kBgPrimary : Colors.white),
                      onPressed: () {},
                      child: Text(
                        value.detail?.attributes?[index].name ?? "",
                        style: TextStyle(
                            color: index == 0
                                ? AppColors.kPrimary
                                : AppColors.kTextGrey),
                      ),
                    )),
          ),
        )
      ]),
    );
  }

  Widget _header() {
    return Consumer<BookModel>(
        builder: ((context, value, child) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _tagCategory(),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer<BookModel>(
                        builder: (context, value, child) => Text(
                              value.detail?.name ?? "--",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            )),
                    FlatButton(
                        minWidth: 28,
                        onPressed: () {},
                        child:const  Icon(
                          Icons.favorite_outline,
                          color: AppColors.kPrimary,
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Text(
                        '\$${value.detail?.salePrice}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: AppColors.kPrimary),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '\$${value.detail?.price}',
                        style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.kTextGrey,
                            decoration: TextDecoration.lineThrough),
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        "50% off",
                        style: TextStyle(
                            fontSize: 14,
                            color: AppColors.kPrimary,
                            fontWeight: FontWeight.w600),
                      )
                    ]),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber[300],
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text("4.5"),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text(
                          "(128 Reviews)",
                          style: TextStyle(color: AppColors.kTextGrey),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )));
  }

  Widget _detail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SessionTitle(
          title: "Details",
          padding: EdgeInsets.only(top: 16, bottom: 8),
        ),
        Container(
            padding: const EdgeInsets.only(top: 8),
            child: Consumer<BookModel>(builder: (context, value, child) {
              final info = value.detail?.getBookInfo();
              return Column(
                children: List.generate(
                    info?.length ?? 0,
                    (index) => Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 4),
                              width: 180,
                              child: Text(
                                info?[index].label ?? "",
                                style:
                                    const TextStyle(color: AppColors.kTextGrey),
                              ),
                            ),
                            Text(info?[index].value ?? "")
                          ],
                        )),
              );
            }))
      ],
    );
  }

  Widget _releatedSection() {
    return Container(
      color: AppColors.kBgGgrey,
      // child: ListBookSession(
      //   title: "Related Book",
      //   child: Wrap(
      //     spacing: 12,
      //     // TODO: replace data
      //     children: List.generate(listBestselling.length,
      //         (index) => BookCard(book: listBestselling[index])),
      //   ),
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as BookDetailArgs;
    Provider.of<BookModel>(context).getDetail(args.id);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Stack & Positioned Widget'),
        centerTitle: true,
      ),
      bottomNavigationBar: const BookDetailBottom(),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Consumer<BookModel>(
                    builder: (context, value, child) => Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BookListImage(listMedia: value.detail!.media ?? []),
                          _header(),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Divider(
                              thickness: 1,
                              color: Colors.black12,
                            ),
                          ),
                          _attributes(),
                          _shortDescription(),
                          _detail(),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Divider(
                              thickness: 1,
                              color: Colors.black12,
                            ),
                          ),
                          const ReviewContainer(),
                          _releatedSection()
                        ]),
                  )))),
    );
  }
}

class BookDetailArgs {
  String id;
  BookDetailArgs({required this.id});
}
