import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_folder/provider/account_model.dart';
import 'package:flutter_folder/provider/address_model.dart';
import 'package:flutter_folder/provider/attribute_model.dart';
import 'package:flutter_folder/provider/author_model.dart';
import 'package:flutter_folder/provider/book_model.dart';
import 'package:flutter_folder/provider/cart.dart';
import 'package:flutter_folder/provider/category_model.dart';
import 'package:flutter_folder/provider/chat_provider.dart';
import 'package:flutter_folder/provider/ghn_model.dart';
import 'package:flutter_folder/provider/order.dart';
import 'package:flutter_folder/provider/review_provider.dart';
import 'package:flutter_folder/provider/shipping.dart';
import 'package:flutter_folder/provider/shipping_fee.dart';
import 'package:flutter_folder/provider/wishlist_provider.dart';
import 'package:flutter_folder/routes/index.dart';
import 'package:flutter_folder/screens/home/home_screens.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

// // Obtain a list of the available cameras on the device.
//   final cameras = await availableCameras();

// // Get a specific camera from the list of available cameras.
//   final firstCamera = cameras.first;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AccountModel()),
        ChangeNotifierProvider(create: (context) => BookModel()),
        ChangeNotifierProvider(create: (context) => AuthorModel()),
        ChangeNotifierProvider(create: (context) => CategoryModel()),
        ChangeNotifierProvider(create: (context) => AttributeModel()),
        ChangeNotifierProvider(create: (context) => ChatProvider()),
        ChangeNotifierProvider(create: (context) => Cart()),
        // ChangeNotifierProvider(create: (context) => ProfileState())
        ChangeNotifierProvider(create: (context) => GHNModel()),
        ChangeNotifierProvider(create: (context) => AddressModel()),
        ChangeNotifierProvider(create: (context) => Shipping()),
        ChangeNotifierProvider(create: (context) => ShippingFee()),
        ChangeNotifierProvider(create: (context) => Order()),
        ChangeNotifierProvider(create: (context) => ReviewProvider()),
        ChangeNotifierProvider(create: (context) => WishlistProvider()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          onGenerateRoute: RouteManager.generateRoute,
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
            fontFamily: GoogleFonts.inter().fontFamily,
          ),
          navigatorKey: navigatorKey, // to get current context at anywhere
          home: const HomeScreen()),
    );
  }
}
