import 'package:flutter/material.dart';
import 'package:flutter_folder/components/button/primary_button.dart';
import 'package:flutter_folder/components/form/outlined_input.dart';

class ChangePWValue {
  late String currentPassword;
  late String confirmPassword;
  late String newPassword;
  ChangePWValue();
}

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({Key? key}) : super(key: key);

  @override
  _ChangePasswordFormState createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  late ChangePWValue formValue = ChangePWValue();
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
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: PrimaryButton(
          buttonText: "Submit",
          fullWidth: true,
          filled: true,
          textColor: Colors.white,
        ),
      )
    ]);
  }
}
