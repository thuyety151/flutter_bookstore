import 'package:flutter/material.dart';
import 'package:flutter_folder/components/avatar.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/screens/profile/components/personal_info_card.dart';

class ProfileDetailScreen extends StatefulWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);

  @override
  _ProfilDetaileScreenState createState() => _ProfilDetaileScreenState();
}

class _ProfilDetaileScreenState extends State<ProfileDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/images/bg_cur.png"),
                    fit: BoxFit.cover,
                  )),
                  alignment: Alignment.center,
                  child: const Avatar(),
                ),
                const Text(
                  "thuyet15",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      letterSpacing: 2),
                ),
                const Text(
                  "thuyet15@gmail.com",
                  style: TextStyle(color: AppColors.kTextGrey),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Personal Information",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    )),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const PersonalInfoCard(),
                ),
              ],
            ),
          ),
        ));
  }
}
