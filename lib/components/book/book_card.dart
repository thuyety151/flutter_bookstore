import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/configs/constants.dart';
import 'package:flutter_folder/mocks/models/BestSelling.dart';
import '../rate.dart';

class BookCard extends StatelessWidget {
  const BookCard({Key? key, required this.book}) : super(key: key);
  final BestSellingModel book;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 170,
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image(
            image: NetworkImage(book.pictureUrl),
            height: 194,
            width: 146,
            fit: BoxFit.fitHeight,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              book.attributeName.toUpperCase(),
              style: AppTextStyles.attribute,
            ),
            Rate()
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          book.name,
          style: AppTextStyles.title,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          book.authorName,
          style: AppTextStyles.caption,
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "\$${book.price}",
                  style: AppTextStyles.price,
                ),
                SizedBox(width: 4),
                Text(
                  "\$201",
                  style: TextStyle(
                      color: AppColors.kTextGrey,
                      fontSize: 12,
                      decoration: TextDecoration.lineThrough),
                ),
              ],
            ),
            Image(image: AssetImage("assets/icons/icon-cart-primary.png"))
          ],
        )
      ]),
    );
  }
}
