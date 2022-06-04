import 'package:flutter/material.dart';
import 'package:flutter_folder/components/custom_text_style.dart';
import 'package:flutter_folder/configs/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../components/button/primary_button.dart';
import '../../../configs/size_config.dart';
import '../../../models/coupon.dart';
import '../../../provider/cart.dart';
import '../../../provider/coupons.dart';
import '../../../routes/index.dart';

class CartCheckOut extends StatefulWidget {
  const CartCheckOut({Key? key}) : super(key: key);

  @override
  State<CartCheckOut> createState() => _CartCheckOutState();
}

class _CartCheckOutState extends State<CartCheckOut> {
  late bool isLoading;
  late double totalAmount = 0;

  @override
  void initState() {
    super.initState();

    isLoading = false;
  }

  void onCheckout() {
    // setState(() {
    //   isLoading = true;
    // });
    Navigator.of(context).pushNamed(RouteManager.ROUTE_CHECKOUT);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // discountType:  0.FixedCart, 1.Percentage,
    String formatCoupon(Coupon coupon, double total) {
      if (coupon.id == "") {
        return "Add voucher code";
      }
      if (coupon.discountType == 0) {
        return "- ${coupon.couponAmount} \$";
      } else {
        if (coupon.discountType == 1) {
          return "Discount ${coupon.couponAmount}%";
        }
      }
      return "Add voucher code";
    }

    double formatTotalAmount(Coupon coupon, double total) {
      if (coupon.id == "") {
        return total;
      }
      if (coupon.discountType == 0) {
        return (total - coupon.couponAmount) > 0
            ? (total - coupon.couponAmount)
            : 0;
      } else {
        if (coupon.discountType == 1) {
          return (total - total * (coupon.couponAmount / 100)) > 0
              ? total - total * (coupon.couponAmount / 100)
              : 0;
        }
      }
      return total;
    }

    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20),
                padding: const EdgeInsets.all(10),
                height: getProportionateScreenWidth(40),
                width: getProportionateScreenWidth(40),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset("assets/icons/receipt.svg"),
              ),
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(RouteManager.ROUTE_USER_COUPONS);
                  },
                  child: Row(children: [
                    Consumer2<Cart, Coupons>(
                      builder: (context, cart, coupons, child) => Text(
                          formatCoupon(
                              coupons.selectedCoupon, cart.totalAmount)),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: kTextColor,
                      ),
                    )
                  ])),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 30),
                child: Text(
                  "Total:",
                  style: CustomTextStyle.textFormFieldSemiBold
                      .copyWith(fontSize: 16),
                ),
              ),
              Consumer2<Cart, Coupons>(
                  builder: (context, cart, coupons, child) => Container(
                        margin: const EdgeInsets.only(right: 30),
                        child: Text(
                          '\$' +
                              formatTotalAmount(
                                      coupons.selectedCoupon, cart.totalAmount)
                                  .toStringAsFixed(2),
                          style: CustomTextStyle.textFormFieldBlack
                              .copyWith(color: Colors.red, fontSize: 16),
                        ),
                      )),
            ],
          ),
          const SizedBox(height: 20),
          PrimaryButton(
            onTap: onCheckout,
            buttonText: "Check Out",
            buttonColor: const Color.fromARGB(255, 249, 82, 69),
            textColor: Colors.white,
            buttonWidth: 200,
            loading: isLoading,
          )
        ]);
  }
}
