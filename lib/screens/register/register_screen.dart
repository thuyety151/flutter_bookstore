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
              Container(
                margin: const EdgeInsets.only(top: 16, bottom: 16),
                child: Row(
                  children: <Widget>[
                    const Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Color.fromARGB(100, 158, 158, 158),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      child: const Text(
                        "OR",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Color.fromARGB(100, 158, 158, 158),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: FlatButton(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      onPressed: () {},
                      child: const Image(
                        image: AssetImage("assets/images/google.png"),
                        height: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: FlatButton(
                      onPressed: () {},
                      child: const Image(
                        image: AssetImage("assets/images/facebook.jpg"),
                        height: 30,
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      )),
    );
  }
}
