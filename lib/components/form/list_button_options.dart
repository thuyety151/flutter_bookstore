import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/mocks/models/author.dart';

class ListButtonOptions extends StatelessWidget {
  const ListButtonOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 4,
      children: List.generate(
          categories.length,
          (index) => OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: BorderSide(
                        width: 1.0,
                        color:
                            index == 0 ? AppColors.kPrimary : Colors.black38),
                    backgroundColor:
                        index == 0 ? AppColors.kPrimary : Colors.white),
                onPressed: () {},
                child: Text(
                  categories[index],
                  style: TextStyle(
                      color: index == 0 ? Colors.white : AppColors.kTextGrey),
                ),
              )),
    );
  }
}
