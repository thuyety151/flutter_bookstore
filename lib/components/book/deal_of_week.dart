import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/configs/constants.dart';

class DealOfWeekCard extends StatefulWidget {
  const DealOfWeekCard({Key? key}) : super(key: key);

  @override
  _DealOfWeekCardState createState() => _DealOfWeekCardState();
}

class _DealOfWeekCardState extends State<DealOfWeekCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.white),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image(
            image: NetworkImage(
                "https://vcdn.tikicdn.com/media/catalog/product/i/m/img893_3.jpg"),
            height: 102,
            width: 66,
            fit: BoxFit.fitHeight,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Container(
          width: 203,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "paperback".toUpperCase(),
                style: AppTextStyles.attribute,
              ),
              Text(
                "Harry Potter and the Philosopher's Stone",
                style: AppTextStyles.title,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "J.K.Rowling",
                style: AppTextStyles.caption,
              ),
              SizedBox(
                height: 8,
              ),
              Text("\$200", style: AppTextStyles.price),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
              SizedBox(
                height: 4,
              ),
              SliderTheme(
                  data: SliderThemeData(
                      overlayShape: SliderComponentShape.noOverlay,
                      trackHeight: 3,
                      thumbShape: SliderComponentShape.noThumb,
                      trackShape: RoundedRectSliderTrackShape()),
                  child: Slider(
                      activeColor: AppColors.kPrimary,
                      inactiveColor: AppColors.kGrayE5,
                      value: 15,
                      max: 100,
                      onChanged: (double) {
                        print(double);
                      }))
            ],
          ),
        ),
      ]),
    );
  }
}
