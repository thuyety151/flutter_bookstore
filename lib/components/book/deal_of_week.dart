import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/configs/constants.dart';
import 'package:flutter_folder/models/book.dart';

class DealOfWeekCard extends StatefulWidget {
  const DealOfWeekCard({Key? key, required this.model}) : super(key: key);

  final Book model;

  @override
  _DealOfWeekCardState createState() => _DealOfWeekCardState();
}

class _DealOfWeekCardState extends State<DealOfWeekCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.white),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image(
            image: NetworkImage(widget.model.pictureUrl ?? ""),
            // "https://vcdn.tikicdn.com/media/catalog/product/i/m/img893_3.jpg"),
            height: 102,
            width: 66,
            fit: BoxFit.fitHeight,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        SizedBox(
          width: 203,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.model.attributeName!.toUpperCase(),
                style: AppTextStyles.attribute,
              ),
              Text(
                widget.model.name,
                style: AppTextStyles.title,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                widget.model.attributeName ?? "",
                style: AppTextStyles.caption,
              ),
              const SizedBox(
                height: 8,
              ),
              Text("\$" + widget.model.price.toString(),
                  style: AppTextStyles.price),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Already sold: 14",
                    style: AppTextStyles.caption,
                  ),
                  Text(
                    "Available: 90",
                    style: AppTextStyles.caption,
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              SliderTheme(
                  data: SliderThemeData(
                      overlayShape: SliderComponentShape.noOverlay,
                      trackHeight: 3,
                      thumbShape: SliderComponentShape.noThumb,
                      trackShape: const RoundedRectSliderTrackShape()),
                  child: Slider(
                      activeColor: AppColors.kPrimary,
                      inactiveColor: AppColors.kGrayE5,
                      value: 15,
                      max: 100,
                      onChanged: (double x) {
                        // ignore: avoid_print
                        print(x);
                      }))
            ],
          ),
        ),
      ]),
    );
  }
}
