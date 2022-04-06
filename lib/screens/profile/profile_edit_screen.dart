import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folder/components/avatar.dart';
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
          padding: EdgeInsets.symmetric(vertical: 32),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/bg_cur.png"),
            fit: BoxFit.cover,
          )),
          alignment: Alignment.center,
          child: Avatar(),
        ),
        Container(
          child: Text(
            "thuyet15",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 22, letterSpacing: 2),
          ),
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
              child: Container(
            child: Column(children: [
              _generalInfo(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: EditProfileForm(),
              )
            ]),
          )),
        ));
  }
}
