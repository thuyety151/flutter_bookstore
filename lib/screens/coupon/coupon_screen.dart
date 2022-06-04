import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/screens/coupon/components/coupon_list.dart';

class CouponScreen extends StatelessWidget {
  static String routeName = '/coupons';

  const CouponScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.kPrimary,
          foregroundColor: Colors.white,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Your Coupons',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          )),
      body: const SingleChildScrollView(
        child: CouponList(),
      ),
      backgroundColor: Colors.grey.shade300,
    );
  }
}
