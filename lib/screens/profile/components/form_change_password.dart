import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_folder/components/button/primary_button.dart';
import 'package:flutter_folder/components/form/outlined_input.dart';
import 'package:flutter_folder/provider/account_model.dart';
import 'package:provider/provider.dart';

class ChangePWValue {
  late String currentPassword;
  late String confirmPassword;
  late String newPassword;
  ChangePWValue.empty() {
    currentPassword = "";
    confirmPassword = "";
    newPassword = "";
  }

  String toUpdateBodyJson() {
    Map<String, dynamic> map = {
      "currentPassword": currentPassword,
      "newPassword": newPassword,
    };
    return json.encode(map);
  }
}

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({Key? key}) : super(key: key);

  @override
  _ChangePasswordFormState createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  late ChangePWValue formValue = ChangePWValue.empty();
  late bool loading = false;

  void changePassword() {
    setState(() {
      loading = true;
    });
    Provider.of<AccountModel>(context, listen: false).changePassword(formValue,
        () {
      Navigator.pop(context);
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      OutlinedInput(
        onUpdateValue: (value) {},
        label: "Current Password",
        obscureText: true,
        modelValue: formValue.currentPassword,
      ),
      OutlinedInput(
        onUpdateValue: (value) {},
        label: "New Password",
        obscureText: true,
        modelValue: formValue.newPassword,
      ),
      OutlinedInput(
        onUpdateValue: (value) {},
        label: "Confirm New Password",
        obscureText: true,
        modelValue: formValue.confirmPassword,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: PrimaryButton(
          buttonText: "Submit",
          fullWidth: true,
          filled: true,
          textColor: Colors.white,
          onTap: changePassword,
          loading: loading,
        ),
      )
    ]);
  }
}
