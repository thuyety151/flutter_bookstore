import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: Colors.black26)
          // boxShadow: [
          //   BoxShadow(color: AppColors.text_grey, blurRadius: 25, spreadRadius: 0.5)
          // ],
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/icons/icon-cart.png"),
            height: 38,
          ),
          Text(
            "Progress order",
            style: TextStyle(
                fontWeight: FontWeight.w700, color: AppColors.kTextGrey),
          ),
          Text(
            "10+",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          )
        ],
      ),
    );
  }
}
