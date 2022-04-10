import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folder/components/rate.dart';
import 'package:flutter_folder/configs/app_colors.dart';

class OptionsReview extends StatelessWidget {
  const OptionsReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Wrap(
            direction: Axis.vertical,
            spacing: 8,
            children: List.generate(
                5,
                (index) => Container(
                      height: 18,
                      child: Row(
                        children: [
                          Checkbox(
                              activeColor: AppColors.kPrimary,
                              value: index % 2 == 0,
                              onChanged: (bool? value) {}),
                          Rate(
                            size: 18,
                            rate: 5 - index,
                          )
                        ],
                      ),
                    ))));
  }
}
