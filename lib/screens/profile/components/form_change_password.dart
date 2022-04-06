import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folder/components/button/primary_button.dart';
import 'package:flutter_folder/components/form/outlined_input.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({Key? key}) : super(key: key);

  @override
  _ChangePasswordFormState createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      OutlinedInput(label: "Current Password", obscureText: true),
      OutlinedInput(label: "New Password", obscureText: true),
      OutlinedInput(label: "Confirm New Password", obscureText: true),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: PrimaryButton(
          buttonText: "Submit",
          onTap: () {},
          fullWidth: true,
          filled: true,
          textColor: Colors.white,
        ),
      )
    ]);
  }
}
