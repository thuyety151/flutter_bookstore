import 'package:flutter/material.dart';
import 'package:flutter_folder/components/button/primary_button.dart';
import 'package:flutter_folder/components/form/address_picker.dart';
import 'package:flutter_folder/components/form/outlined_input.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({Key? key}) : super(key: key);

  void update() {
    // TODO: implement update profile
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      OutlinedInput(
        onUpdateValue: (value) {},
        label: "fullname",
      ),
      OutlinedInput(
        label: "email",
        onUpdateValue: (value) {},
      ),
      OutlinedInput(
        label: "birthday",
        onUpdateValue: (value) {},
      ),
      const AddressPicker(),
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: PrimaryButton(
          buttonText: "Update",
          fullWidth: true,
          filled: true,
          textColor: Colors.white,
        ),
      )
    ]);
  }
}
