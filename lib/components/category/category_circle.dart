import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/mocks/models/Category.dart';

class CardCategoryCircle extends StatelessWidget {
  const CardCategoryCircle({Key? key, required this.category})
      : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          child: Image(
            image: NetworkImage(category.imgUrl),
            height: 50,
            width: 50,
          ),
        ),
        SizedBox(height: 8),
        Text(
          category.name,
          style: TextStyle(color: AppColors.kTextGrey, fontSize: 12),
        )
      ]),
    );
  }
}
