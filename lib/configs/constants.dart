// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_folder/components/badge.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/configs/size_config.dart';
import 'package:flutter_folder/main.dart';
import 'package:flutter_folder/provider/cart.dart';
import 'package:flutter_folder/routes/index.dart';
import 'package:provider/provider.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
const String kFirstNameNullError = "Please Enter your first name";
const String kLastNameNullError = "Please Enter your last name";
const String kNotNullError = "Please fill out this field";

// Dialog  Error Message
const String kLoginFailed = "Email or Password is incorrect";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: kTextColor),
  );
}

OutlineInputBorder errorInputBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: Colors.red),
  );
}

class AppTextStyles {
  static const title = TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
  static const caption = TextStyle(fontSize: 12, color: AppColors.kTextGrey);
  static const oldPrice = TextStyle(
      fontSize: 12,
      color: AppColors.kTextGrey,
      decoration: TextDecoration.lineThrough);
  static const price = TextStyle(
      fontSize: 14, color: AppColors.kPrimary, fontWeight: FontWeight.bold);
  static const attribute = TextStyle(fontSize: 12, color: AppColors.kPrimary);
}

BoxDecoration showBottomSheetStyle() {
  return const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      color: Colors.white);
}

AppBar customAppBar(String title,
    [double elevation = 1, Color bg = Colors.white, bool includeCart = false]) {
  return AppBar(
    title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        title,
        style: const TextStyle(color: AppColors.kGrey, fontSize: 16),
      ),
      if (includeCart == true) ...[
        Consumer<Cart>(
          builder: (_, cart, ch) => Badge(
            child: ch!,
            value: cart.itemCount.toString(),
            textColor: Colors.white,
          ),
          child: FlatButton(
            onPressed: () {
              Navigator.of(navigatorKey.currentState!.overlay!.context)
                  .pushNamed(RouteManager.ROUTE_CART);
            },
            color: Colors.white,
            height: 38,
            minWidth: 38,
            padding: const EdgeInsets.symmetric(horizontal: 0),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: const Image(
              image: AssetImage(
                "assets/icons/o-icon-cart.png",
              ),
              height: 24,
              width: 24,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ]
    ]),
    centerTitle: true,
    backgroundColor: bg,
    foregroundColor: AppColors.kGrey,
    elevation: elevation,
  );
}
