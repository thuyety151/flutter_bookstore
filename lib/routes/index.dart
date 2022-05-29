// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folder/components/image/view_full_screen.dart';
import 'package:flutter_folder/components/image_picker.dart';
import 'package:flutter_folder/screens/address/address_screen.dart';
import 'package:flutter_folder/screens/book_detail/book_detail_screen.dart';
import 'package:flutter_folder/screens/books_for_sale/books_for_sale_screen.dart';
import 'package:flutter_folder/screens/cart/cart_screen.dart';
import 'package:flutter_folder/screens/coupon/components/coupon_list.dart';
import 'package:flutter_folder/screens/coupon/coupon_screen.dart';
import 'package:flutter_folder/screens/home/home_screens.dart';
import 'package:flutter_folder/screens/login/login_screen.dart';
import 'package:flutter_folder/screens/order_success/order_success_screen.dart';
import 'package:flutter_folder/screens/profile/change_password_screen.dart';
import 'package:flutter_folder/screens/profile/profile_detail_screen.dart';
import 'package:flutter_folder/screens/profile/profile_edit_screen.dart';
import 'package:flutter_folder/screens/profile/profile_screen.dart';
import 'package:flutter_folder/screens/checkout/checkout_screen.dart';
import 'package:flutter_folder/screens/wishlist/wishlist_screen.dart';

import '../screens/chat/chat_screen.dart';
import '../screens/manage_order/manage_order_screen.dart';
import '../screens/register/register_screen.dart';
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
  static const String ROUTE_CART = "/cart";
  static const String ROUTE_REGISTER = "/register";
  static const String ROUTE_CHECKOUT = "/checkout";
  static const String ROUTE_ORDER_SUCCESS = "/order-success";
  static const String ROUTE_MANAGE_ORDER = "/manage-order";
  static const String ROUTE_REVIEW = "/review";
  static const String ROUTE_CHAT = "/chat";
  static const String ROUTE_IMAGE_PICKER = "/image-picker";
  static const String ROUTE_USER_COUPONS = "/coupons";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ROUTE_LOGIN:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case ROUTE_HOME_PAGE:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case ROUTE_PRODUCT_DETAIL:
        return MaterialPageRoute(
            builder: (context) => const BookDetailScreen(), settings: settings);
      case ROUTE_PROFILE:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      case ROUTE_PROFILE_DETAIL:
        return MaterialPageRoute(
            builder: (context) => const ProfileDetailScreen());
      case ROUTE_PROFILE_EDIT:
        return MaterialPageRoute(builder: (context) => const EditProfile());
      case ROUTE_ADDRESSES:
        return MaterialPageRoute(builder: (context) => const AddressScreen());
      case ROUTE_CHANGE_PASSWORD:
        return MaterialPageRoute(
            builder: (context) => const ChangePasswordScreen());
      // case ROUTE_DEMO:
      //   return MaterialPageRoute(builder: (context) => Layout());
      case ROUTE_IMAGES_DETAIL:
        return MaterialPageRoute(
            builder: (context) => const ViewImageFullScreen());
      case ROUTE_WISH_LIST:
        return MaterialPageRoute(builder: (context) => const WishlistScreen());
      case ROUTE_BOOKS_FOR_SALE:
        return MaterialPageRoute(
            builder: (context) => const BooksForSaleScreen(),
            settings: settings);
      case ROUTE_CART:
        return MaterialPageRoute(builder: (context) => const CartScreen());
      case ROUTE_REGISTER:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case ROUTE_CHECKOUT:
        return MaterialPageRoute(builder: (context) => const CheckoutScreen());
      case ROUTE_ORDER_SUCCESS:
        return CupertinoPageRoute(builder: (context) => const OrderSuccess());
      case ROUTE_MANAGE_ORDER:
        return MaterialPageRoute(
            builder: (context) => const ManageOrderScreen());
      case ROUTE_REVIEW:
        return MaterialPageRoute(
            builder: (context) => const ReviewScreen(), settings: settings);
      case ROUTE_CHAT:
        return MaterialPageRoute(builder: (context) => const ChatScreen());
      case ROUTE_IMAGE_PICKER:
        return MaterialPageRoute(builder: (context) => const ImagePicker());
        case ROUTE_USER_COUPONS:
        return MaterialPageRoute(builder: (context) => const CouponScreen());
      default:
        throw const FormatException("Route not found! Check routes again");
    }
  }
}
