import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folder/components/button/primary_button.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/screens/review/components/review_form.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kBgGgrey,
        bottomNavigationBar: Container(
          margin: EdgeInsets.all(16),
          child: PrimaryButton(
            buttonText: 'Submit Review',
            buttonColor: AppColors.kPrimary,
            textColor: Colors.white,
            onTap: () {},
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [ReviewForm()]),
        )));
  }
}
