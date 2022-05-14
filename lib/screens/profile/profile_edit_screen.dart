import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folder/components/avatar.dart';
import 'package:flutter_folder/components/image_picker.dart';
import 'package:flutter_folder/screens/profile/components/form_edit_profile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Widget _generalInfo() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 32),
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/bg_cur.png"),
            fit: BoxFit.cover,
          )),
          alignment: Alignment.center,
          child: const Avatar(
            icon: true,
          ),
        ),
        const Text(
          "thuyet15",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 22, letterSpacing: 2),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(children: [
            _generalInfo(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: EditProfileForm(),
            )
          ])),
        ));
  }
}
