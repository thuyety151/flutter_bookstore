import 'package:flutter/material.dart';
import 'package:flutter_folder/components/button/primary_button.dart';
import 'package:flutter_folder/components/form/address_picker.dart';
import 'package:flutter_folder/components/form/outlined_input.dart';
import 'package:flutter_folder/models/profile.dart';
import 'package:flutter_folder/provider/profile/profile_state.dart';
import 'package:provider/provider.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileState profile = new ProfileState();

    void updateProfile() {
      profile.update(new Profile("hoh", "hhooho"));
      Provider.of<ProfileState>(context, listen: false)
          .update(new Profile("hoh", "hhooho"));
    }

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
            onTap: updateProfile,
            fullWidth: true,
            filled: true,
            textColor: Colors.white,
          ),
        )
      ]),
    );
  }
}
