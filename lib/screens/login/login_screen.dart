import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folder/components/button/primary_button.dart';
import 'package:flutter_folder/configs/constants.dart';
import 'package:flutter_folder/models/Login.dart';
import 'package:flutter_folder/routes/index.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginRequestModel loginRequestModel;
  late bool isLoading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginRequestModel = new LoginRequestModel();
    isLoading = false;
  }

  void onLogin() {
    setState(() {
      isLoading = true;
    });

    Navigator.of(context).pushNamed(RouteManager.ROUTE_HOME_PAGE);
    // Navigator.of(context).push(
    //   MaterialPageRoute(builder: (_) => ProfileScreen()),
    // );

    // APIService apiService = new APIService();
    // apiService.login(loginRequestModel).then((value) {
    //   if (value != null) {
    //     if (value.token?.isNotEmpty ?? false) {
    //       setState(() {
    //         isLoading = true;
    //       });
    //       Navigator.of(context).pushNamed(RouteManager.ROUTE_HOME_PAGE);
    //       // final snackBar = SnackBar(
    //       //     content: Text("Login Successful"));
    //     } else {
    //       final snackBar = SnackBar(content: Text(value.error ?? ""));
    //     }
    //   }
    // });
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
                    onChanged: (input) => loginRequestModel.email = input,
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
                    onChanged: (input) => loginRequestModel.password = input,
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
                      children: [
                        Text(
                          "Don't have an account ?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(RouteManager.ROUTE_REGISTER);
                          },
                          child: Text(
                            " Register",
                            style: const TextStyle(fontWeight: FontWeight.w800),
                          ),
                        )
                      ],
                    ))
              ],
            )),
      ),
    );
  }
}
