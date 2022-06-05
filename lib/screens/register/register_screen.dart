// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/constants.dart';

import '../../configs/size_config.dart';
import 'components/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  void selectContinue(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return BooksForSale();
    //     }
    //   )
    // );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        backgroundColor: kPrimaryColor,
      ),
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text("Register Account", style: headingStyle),
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              const RegisterForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.04),
            ]),
          ),
        ),
      )),
    );
  }
}
