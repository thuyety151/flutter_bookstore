import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folder/components/avatar.dart';
import 'package:flutter_folder/components/image_picker.dart';
import 'package:flutter_folder/configs/constants.dart';
import 'package:flutter_folder/provider/account_model.dart';
import 'package:flutter_folder/screens/profile/components/form_edit_profile.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  void deactivate() {
    Provider.of<AccountModel>(context, listen: false).setImage(XFile(""));
    super.deactivate();
  }

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
          child: const Avatar(icon: true, isEdit: true),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar("", 0, Colors.transparent),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 28),
            child: Column(children: [
              _generalInfo(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: EditProfileForm(),
              )
            ])));
  }
}
