// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folder/components/image/view_full_screen.dart';
import 'package:flutter_folder/screens/address/address_screen.dart';
import 'package:flutter_folder/screens/book_detail/book_detail_screen.dart';
import 'package:flutter_folder/screens/books_for_sale/books_for_sale_screen.dart';
import 'package:flutter_folder/screens/home/home_screens.dart';
import 'package:flutter_folder/screens/login/login_screen.dart';
import 'package:flutter_folder/screens/profile/change_password_screen.dart';
import 'package:flutter_folder/screens/profile/profile_detail_screen.dart';
import 'package:flutter_folder/screens/profile/profile_edit_screen.dart';
import 'package:flutter_folder/screens/profile/profile_screen.dart';
import 'package:flutter_folder/screens/review/review_screen.dart';

class RouteManager {
  static const String ROUTE_LOGIN = "/login";
  static const String ROUTE_HOME_PAGE = "/home";
  static const String ROUTE_PRODUCT_DETAIL = "/product-detail";
  static const String ROUTE_PROFILE = "/profile";
  static const String ROUTE_PROFILE_DETAIL = "/profile-detail";
  static const String ROUTE_PROFILE_EDIT = "/profile-edit";
  static const String ROUTE_ADDRESSES = "/addresses";
  static const String ROUTE_CHANGE_PASSWORD = "/change-password";
  static const String ROUTE_DEMO = "/demo";
  static const String ROUTE_IMAGES_DETAIL = "/view-image";
  static const String ROUTE_WISH_LIST = "/wish-list";
  static const String ROUTE_BOOKS_FOR_SALE = "/books-for-sale";
  static const String ROUTE_REVIEW = "/review";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ROUTE_LOGIN:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case ROUTE_HOME_PAGE:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case ROUTE_PRODUCT_DETAIL:
        return MaterialPageRoute(builder: (context) => BookDetailScreen());
      case ROUTE_PROFILE:
        return MaterialPageRoute(builder: (context) => ProfileScreen());
      case ROUTE_PROFILE_DETAIL:
        return MaterialPageRoute(builder: (context) => ProfileDetailScreen());
      case ROUTE_PROFILE_EDIT:
        return MaterialPageRoute(builder: (context) => EditProfile());
      case ROUTE_ADDRESSES:
        return MaterialPageRoute(builder: (context) => AddressScreen());
      case ROUTE_CHANGE_PASSWORD:
        return MaterialPageRoute(builder: (context) => ChangePasswordScreen());
      // case ROUTE_DEMO:
      //   return MaterialPageRoute(builder: (context) => Layout());
      case ROUTE_IMAGES_DETAIL:
        return MaterialPageRoute(builder: (context) => ViewImageFullScreen());
      // case ROUTE_WISH_LIST:
      //   return MaterialPageRoute(builder: (context) => WishListScreen());
      case ROUTE_BOOKS_FOR_SALE:
        return MaterialPageRoute(builder: (context) => BooksForSaleScreen());
      case ROUTE_REVIEW:
        return MaterialPageRoute(builder: (context) => ReviewScreen());
      default:
        throw FormatException("ROute not found! Check routes again");
    }
  }
}
