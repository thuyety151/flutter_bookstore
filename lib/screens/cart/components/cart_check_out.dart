import 'package:flutter/material.dart';
import 'package:flutter_folder/components/custom_text_style.dart';
import 'package:flutter_folder/configs/constants.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/button/primary_button.dart';
import '../../../configs/size_config.dart';
import '../../../routes/index.dart';

class CartCheckOut extends StatefulWidget {
  @override
  State<CartCheckOut> createState() => _CartCheckOutState();
}

class _CartCheckOutState extends State<CartCheckOut> {
  late bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  void onCheckout() {
    setState(() {
      isLoading = true;
    });
    Navigator.of(context).pushNamed(RouteManager.ROUTE_CHECKOUT);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  padding: EdgeInsets.all(10),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                Spacer(),
                Text("Add voucher code"),
                const SizedBox(width: 10),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: kTextColor,
                  ),
                )
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Text(
                    "Total:",
                    style: CustomTextStyle.textFormFieldSemiBold
                        .copyWith(fontSize: 16),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 30),
                  child: Text(
                    "\$299.00",
                    style: CustomTextStyle.textFormFieldBlack
                        .copyWith(color: Colors.red, fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            PrimaryButton(
              onTap: onCheckout,
              buttonText: "Check Out",
              buttonColor: Color.fromARGB(255, 249, 82, 69),
              textColor: Colors.white,
              buttonWidth: 200,
              loading: isLoading,
            )
          ]),
    );
  }
}
