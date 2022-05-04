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
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Avatar(
        size: 20,
      ),
      const SizedBox(
        width: 8,
      ),
      SizedBox(
        width: 320,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: const [
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
          const SizedBox(
            height: 6,
          ),
          const ReadMoreText(
            "These Illustrated edition’s are my first time ever reading the Harry Potter series, and I am so happy to be reading the series through these editions",
            trimLines: 2,
            colorClickableText: Colors.pink,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            moreStyle: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.pink),
            style: TextStyle(color: Colors.black),
          ),
          const SizedBox(
            height: 8,
          ),
          const ListImagesReview(),
          Row(
            children: const [
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
                      color: AppColors.kTextGrey, fontWeight: FontWeight.w600))
            ],
          )
        ]),
      )
    ]);
  }
}
