import 'package:flutter/material.dart';
import 'package:flutter_folder/components/rate.dart';
import 'package:flutter_folder/configs/app_colors.dart';

class OptionsReview extends StatefulWidget {
  const OptionsReview({Key? key, required this.getRate}) : super(key: key);
  final Function(int) getRate;

  @override
  _OptionsReviewState createState() => _OptionsReviewState();
}

class _OptionsReviewState extends State<OptionsReview> {
  late int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Wrap(
        direction: Axis.vertical,
        spacing: 8,
        children: List.generate(
            5,
            (index) => SizedBox(
                  height: 18,
                  child: Row(
                    children: [
                      Checkbox(
                          activeColor: AppColors.kPrimary,
                          value: index == selectedIndex,
                          onChanged: (bool? value) {
                            if (value == true) {
                              setState(() {
                                selectedIndex = index;
                              });
                            }
                            if (value == false && index == selectedIndex) {
                              selectedIndex = 5;
                            }
                            widget.getRate(5 - index);
                          }),
                      Rate(
                        size: 18,
                        rate: 5 - index,
                      )
                    ],
                  ),
                )));
  }
}
