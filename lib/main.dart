import 'package:flutter/material.dart';
import 'package:flutter_folder/provider/account_model.dart';
import 'package:flutter_folder/provider/author_model.dart';
import 'package:flutter_folder/provider/book_model.dart';
import 'package:flutter_folder/provider/category_model.dart';
import 'package:flutter_folder/routes/index.dart';
import 'package:flutter_folder/screens/login/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
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
        ChangeNotifierProvider(create: (context) => CategoryModel())
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
          home: const LoginScreen()),
    );
  }
}
