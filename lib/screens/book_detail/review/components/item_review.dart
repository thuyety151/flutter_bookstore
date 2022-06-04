import 'package:flutter/material.dart';
import 'package:flutter_folder/components/avatar.dart';
import 'package:flutter_folder/components/rate.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/helpers/format.dart';
import 'package:flutter_folder/models/review.dart';
import 'package:readmore/readmore.dart';

import 'list_images_review.dart';

class ItemReview extends StatefulWidget {
  const ItemReview({Key? key, this.value}) : super(key: key);

  final Review? value;

  @override
  _ItemReviewState createState() => _ItemReviewState();
}

class _ItemReviewState extends State<ItemReview> {
  @override
  Widget build(BuildContext context) {
    return Row(
       key: UniqueKey(),
      crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            children: [
              const Text(
                "thuyety15",
                style: TextStyle(
                    color: AppColors.kTextGrey, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                calculateTimeDifferenceBetween(widget.value!.createDate),
                style: const TextStyle(color: AppColors.kTextGrey),
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          ReadMoreText(
            widget.value?.content ?? "",
            trimLines: 2,
            colorClickableText: Colors.pink,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            moreStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.pink),
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(
            height: 8,
          ),
          ListImagesReview(value: widget.value!.media),
          Row(
            children: [
              Rate(
                rate: widget.value!.rate,
              )
            ],
          )
        ]),
      )
    ]);
  }
}
