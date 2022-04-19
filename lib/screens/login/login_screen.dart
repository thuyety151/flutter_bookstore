import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folder/components/button/primary_button.dart';
import 'package:flutter_folder/configs/constants.dart';
import 'package:flutter_folder/models/login.dart';
import 'package:flutter_folder/models/services/AccountApi.dart';
import 'package:flutter_folder/models/services/address/DistrictApi.dart';
import 'package:flutter_folder/routes/index.dart';

class Temp {
  String email;
  String password;
  Temp({required this.email, required this.password});
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool isLoading;
  late LoginRequestModel formValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = false;
    formValue = LoginRequestModel(email: "", password: "");
  }

  Future<void> onLogin() async {
    setState(() {
      isLoading = true;
    });

    AccountApi accountApi = new AccountApi();
    var response = await accountApi.login(formValue);
    if (response.token != null) {
      // TODO: SHow popup ; check conditional with status code instead of token
      Navigator.of(context).pushNamed(RouteManager.ROUTE_HOME_PAGE);
    }
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: 32),
                  child: const Image(
                    image: AssetImage("assets/images/app_logo.png"),
                    height: 80,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: TextField(
                    onChanged: (input) => formValue.email = input,
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      prefixIcon: Icon(Icons.mail_outline,
                          size: 20, color: Colors.grey),
                      enabledBorder: outlineInputBorder(),
                      focusedBorder: outlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: TextField(
                    onChanged: (input) => formValue.password = input,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.lock_outline,
                          size: 20, color: Colors.grey),
                      enabledBorder: outlineInputBorder(),
                      focusedBorder: outlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8, bottom: 8),
                  alignment: Alignment.centerRight,
                  child: const Text(
                    "Forgot password",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                PrimaryButton(
                    onTap: onLogin,
                    buttonText: "Sign in",
                    buttonColor: Color.fromARGB(255, 249, 82, 69),
                    textColor: Colors.white,
                    buttonWidth: double.infinity,
                    loading: isLoading),
                Container(
                  margin: EdgeInsets.only(top: 16, bottom: 16),
                  child: Row(
                    children: <Widget>[
                      const Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Color.fromARGB(100, 158, 158, 158),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8, right: 8),
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
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        onPressed: () {},
                        child: Image(
                          image: AssetImage("assets/images/google.png"),
                          height: 30,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: FlatButton(
                        onPressed: () {},
                        child: Image(
                          image: AssetImage("assets/images/facebook.jpg"),
                          height: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Don't have an account ?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          " Register",
                          style: TextStyle(fontWeight: FontWeight.w800),
                        )
                      ],
                    ))
              ],
            )),
      ),
    );
  }
}
