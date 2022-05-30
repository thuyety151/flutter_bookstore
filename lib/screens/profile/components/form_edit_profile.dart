import 'package:flutter/material.dart';
import 'package:flutter_folder/components/button/primary_button.dart';
import 'package:flutter_folder/components/form/outlined_input.dart';
import 'package:flutter_folder/models/account.dart';
import 'package:flutter_folder/provider/account_model.dart';
import 'package:provider/provider.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({Key? key}) : super(key: key);

  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  late Account formValue = Account.empty();
  
  late bool loading = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      formValue = Provider.of<AccountModel>(context, listen: false).account;
    });
  }

  void updateProfile() {
    setState(() {
      loading = true;
    });
    Provider.of<AccountModel>(context, listen: false).updateProfile(formValue,
        () {
      Navigator.pop(context);
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(key: Key(formValue.email.toString()), children: [
      OutlinedInput(
        onUpdateValue: (value) {
          setState(() {
            formValue.firstName = value;
          });
        },
        label: "first name",
        modelValue: formValue.firstName,
      ),
      OutlinedInput(
        label: "last name",
        onUpdateValue: (value) {
          formValue.lastName = value;
        },
        modelValue: formValue.lastName,
      ),
      OutlinedInput(
          label: "email",
          onUpdateValue: (value) {},
          modelValue: formValue.email,
          enabled: false),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: PrimaryButton(
          buttonText: "Update",
          fullWidth: true,
          filled: true,
          textColor: Colors.white,
          onTap: updateProfile,
          loading: loading,
        ),
      )
    ]);
  }
}
