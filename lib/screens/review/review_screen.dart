import 'package:flutter/material.dart';
import 'package:flutter_folder/components/button/primary_button.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/configs/constants.dart';
import 'package:flutter_folder/provider/order.dart';
import 'package:flutter_folder/screens/review/components/review_form.dart';
import 'package:provider/provider.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  late bool isSubmit = false;
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ReviewArgs;

    return Scaffold(
        backgroundColor: AppColors.kBgGgrey,
        bottomNavigationBar: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: PrimaryButton(
            buttonText: 'Submit Review',
            buttonColor: AppColors.kPrimary,
            textColor: Colors.white,
            onTap: () {
              setState(() {
                isSubmit = true;
              });
            },
          ),
        ),
        appBar: customAppBar("Review", 0),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Consumer<Order>(builder: ((context, value, child) {
            final order =
                value.listOrder.firstWhere((element) => element.id == args.id);

            return Column(
                children: order.items
                    .map((e) => ReviewForm(
                          isSubmit: isSubmit,
                          item: e,
                          totalItem: order.items.length,
                        ))
                    .toList());
          })),
        ));
  }
}

class ReviewArgs {
  String id;
  ReviewArgs({required this.id});
}
