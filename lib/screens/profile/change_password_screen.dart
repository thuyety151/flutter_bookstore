import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/constants.dart';
import 'package:flutter_folder/screens/profile/components/form_change_password.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Change password"),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: const SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ChangePasswordForm(),
      ))),
    );
  }
}
