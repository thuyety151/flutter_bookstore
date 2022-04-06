import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/mocks/bookList.dart';
import 'package:flutter_folder/screens/book_detail/detail/components/book_detail_bottom.dart';
import 'package:flutter_folder/screens/book_detail/detail/components/book_list_image.dart';
import 'package:flutter_folder/screens/book_detail/review/components/session_title.dart';
import 'package:flutter_folder/screens/book_detail/review/review_container.dart';
import 'package:readmore/readmore.dart';

List<String> attributeNames = ["Paperback", "Hardcover", "Kindle", "Audio"];

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({Key? key}) : super(key: key);

  Widget _tagCategory() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.pink[50]),
      child: Text("Fiction"),
    );
  }

  Widget _shortDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SessionTitle(
          title: "Description",
          padding: EdgeInsets.only(top: 4, bottom: 10),
        ),
        SizedBox(
          height: 4,
        ),
        ReadMoreText(
          "Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry's eleventh birthday, a great beetle-eyed giant of a man called Rubeus Hagrid bursts in with some astonishing news: Harry Potter is a wizard, and he has a place at Hogwarts School of Witchcraft and Wizardry. An incredible adventure is about to begin!\nThese new editions of the classic and internationally bestselling, multi-award-winning series feature instantly pick-up-able new jackets by Jonny Duddle, with huge child appeal, to bring Harry Potter to the next generation of readers. It's time to PASS THE MAGIC ON .",
          trimLines: 2,
          colorClickableText: Colors.pink,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
          moreStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.pink),
          style: TextStyle(color: Colors.black),
        )
      ],
    );
  }

  Widget _attributes() {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SessionTitle(
          title: "Attributes",
          padding: EdgeInsets.only(bottom: 8),
        ),
        Wrap(
          direction: Axis.horizontal,
          spacing: 4,
          children: List.generate(
              attributeNames.length,
              (index) => Container(
                      child: OutlinedButton(
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
                      attributeNames[index],
                      style: TextStyle(
                          color: index == 0
                              ? AppColors.kPrimary
                              : AppColors.kTextGrey),
                    ),
                  ))),
        )
      ]),
    );
  }

  Widget _header() {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _tagCategory(),
        SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Harry Potter",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            FlatButton(
                minWidth: 28,
                onPressed: () {},
                child: Icon(
                  Icons.favorite_outline,
                  color: AppColors.kPrimary,
                ))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(children: [
                Text(
                  "\$200",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: AppColors.kPrimary),
                ),
                SizedBox(width: 6),
                Text(
                  "\$255",
                  style: TextStyle(
                      fontSize: 14,
                      color: AppColors.kTextGrey,
                      decoration: TextDecoration.lineThrough),
                ),
                SizedBox(width: 6),
                Text(
                  "50% off",
                  style: TextStyle(
                      fontSize: 14,
                      color: AppColors.kPrimary,
                      fontWeight: FontWeight.w600),
                )
              ]),
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber[300],
                ),
                SizedBox(
                  width: 4,
                ),
                Text("4.5"),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "(128 Reviews)",
                  style: TextStyle(color: AppColors.kTextGrey),
                ),
              ],
            )
          ],
        ),
      ],
    ));
  }

  Widget _detail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SessionTitle(
          title: "Details",
          padding: EdgeInsets.only(top: 16, bottom: 8),
        ),
        Container(
            padding: EdgeInsets.only(top: 8),
            child: Column(
              children: List.generate(
                  bookDetails.length,
                  (index) => Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 4),
                            width: 180,
                            child: Text(
                              bookDetails[index].label + " :",
                              style: TextStyle(color: AppColors.kTextGrey),
                            ),
                          ),
                          Text(bookDetails[index].value)
                        ],
                      )),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Stack & Positioned Widget'),
        centerTitle: true,
      ),
      bottomNavigationBar: BookDetailBottom(),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookListImage(),
              _header(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  thickness: 1,
                  color: Colors.black12,
                ),
              ),
              _attributes(),
              _shortDescription(),
              _detail(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Divider(
                  thickness: 1,
                  color: Colors.black12,
                ),
              ),
              ReviewContainer()
            ]),
      ))),
    );
  }
}
