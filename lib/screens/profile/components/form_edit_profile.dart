import 'package:flutter/material.dart';
import 'package:flutter_folder/components/button/primary_button.dart';
import 'package:flutter_folder/components/form/address_picker.dart';
import 'package:flutter_folder/components/form/outlined_input.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({Key? key}) : super(key: key);

  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        OutlinedInput(
          label: "fullname",
        ),
        OutlinedInput(label: "email"),
        OutlinedInput(
          label: "birthday",
        ),
        AddressPicker(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: PrimaryButton(
            buttonText: "Update",
            onTap: () {},
            fullWidth: true,
            filled: true,
            textColor: Colors.white,
          ),
        )
      ]),
    );
  }
}
