// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_folder/components/button/primary_button.dart';
import 'package:flutter_folder/components/form/outlined_input.dart';
import 'package:flutter_folder/configs/constants.dart';
import 'package:flutter_folder/helpers/validation.dart';
import 'package:flutter_folder/provider/account_model.dart';
import 'package:flutter_folder/routes/index.dart';
import 'package:flutter_folder/services/authentication_service.dart';
import 'package:provider/provider.dart';

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
  late LoginRequestModel formValue = LoginRequestModel(email: "", password: "");
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  Future<void> onLogin() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        isLoading = true;
      });
      AccountModel accountModel =
          Provider.of<AccountModel>(context, listen: false);
      var success = await accountModel.login(formValue);

      if (success == true) {
        Navigator.of(context).pushNamed(RouteManager.ROUTE_HOME_PAGE);
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(buildContext)
                .pushNamed(RouteManager.ROUTE_HOME_PAGE),
            child: Container(
              padding: const EdgeInsets.only(top: 32, right: 28),
              alignment: Alignment.topRight,
              child: const Text("Skip", style: AppTextStyles.title),
            ),
          ),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(bottom: 32),
                        child: const Image(
                          image: AssetImage("assets/images/app_logo.png"),
                          height: 80,
                        ),
                      ),
                      OutlinedInput(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        ruleNames: const [
                          ValidationName.required,
                          ValidationName.ruleEmail
                        ],
                        onUpdateValue: (value) {
                          setState(() {
                            formValue.email = value;
                          });
                        },
                        placeholder: "Enter your email",
                        prefixIcon: const Icon(Icons.mail_outline,
                            size: 20, color: Colors.grey),
                      ),
                      OutlinedInput(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        ruleNames: const [ValidationName.required],
                        onUpdateValue: (value) => {
                          setState(() {
                            formValue.password = value;
                          })
                        },
                        obscureText: true,
                        placeholder: "Enter your password",
                        prefixIcon: const Icon(Icons.lock_outline,
                            size: 20, color: Colors.grey),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8, bottom: 8),
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
                          buttonColor: const Color.fromARGB(255, 249, 82, 69),
                          textColor: Colors.white,
                          buttonWidth: double.infinity,
                          loading: isLoading),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
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
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account ?",
                                style: TextStyle(color: Colors.grey),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(RouteManager.ROUTE_REGISTER);
                                },
                                child: const Text(
                                  " Register",
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                ),
                              )
                            ],
                          ))
                    ],
                  )),
            ),
          ))
        ],
      ),
    );
  }
}
