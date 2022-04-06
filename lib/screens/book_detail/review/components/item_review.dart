import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folder/components/avatar.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:readmore/readmore.dart';

import 'list_images_review.dart';

class ItemReview extends StatefulWidget {
  const ItemReview({Key? key}) : super(key: key);

  @override
  _ItemReviewState createState() => _ItemReviewState();
}

class _ItemReviewState extends State<ItemReview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Avatar(
          size: 20,
        ),
        SizedBox(
          width: 8,
        ),
        Container(
          width: 320,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Text(
                  "thuyety15",
                  style: TextStyle(
                      color: AppColors.kTextGrey, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  "1 hour ago",
                  style: TextStyle(color: AppColors.kTextGrey),
                ),
              ],
            ),
            SizedBox(
              height: 6,
            ),
            ReadMoreText(
              "These Illustrated edition’s are my first time ever reading the Harry Potter series, and I am so happy to be reading the series through these editions",
              trimLines: 2,
              colorClickableText: Colors.pink,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              moreStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink),
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 8,
            ),
            ListImagesReview(),
            Row(
              children: [
                Icon(
                  Icons.favorite,
                  color: AppColors.kPrimary,
                  size: 16,
                ),
                SizedBox(
                  width: 4,
                ),
                Text("127",
                    style: TextStyle(
                        color: AppColors.kTextGrey,
                        fontWeight: FontWeight.w600))
              ],
            )
          ]),
        )
      ]),
    );
  }
}
