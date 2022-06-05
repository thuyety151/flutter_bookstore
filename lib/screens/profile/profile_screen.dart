import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folder/components/avatar.dart';
import 'package:flutter_folder/configs/constants.dart';
import 'package:flutter_folder/provider/account_model.dart';
import 'package:flutter_folder/screens/profile/components/profile_menu.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../../routes/index.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  Widget _menus(BuildContext context) {
    void onPress(String type) {
      switch (type) {
        case "address":
          Navigator.of(context).pushNamed(RouteManager.ROUTE_ADDRESSES);
          break;
        case "account":
          Navigator.of(context).pushNamed(RouteManager.ROUTE_PROFILE_EDIT);
          break;
        case "change-password":
          Navigator.of(context).pushNamed(RouteManager.ROUTE_CHANGE_PASSWORD);
          break;
        case "wishlist":
          Navigator.of(context).pushNamed(RouteManager.ROUTE_WISH_LIST);
          break;
        case "login":
          const storage = FlutterSecureStorage();
          storage.deleteAll();
          FirebaseAuth.instance.signOut();
          Navigator.of(context).pushNamed(RouteManager.ROUTE_LOGIN);
          break;
        case "manage-order":
          Navigator.of(context).pushNamed(RouteManager.ROUTE_MANAGE_ORDER);
          break;
        default:
          Navigator.of(context).pushNamed(RouteManager.ROUTE_PROFILE_EDIT);
      }
    }

    return Column(
      children: [
        ProfileMenu(
          text: "Account",
          iconAssetUrl: "assets/icons/icon-account.png",
          onPress: () => onPress("account"),
        ),
        ProfileMenu(
          text: "Change password",
          iconAssetUrl: "assets/icons/icon-password.png",
          onPress: () => onPress("change-password"),
        ),
        ProfileMenu(
            text: "My Orders",
            iconAssetUrl: "assets/icons/icon-cart.png",
            onPress: () => onPress("manage-order")),
        ProfileMenu(
            text: "Shipping Addresses",
            iconAssetUrl: "assets/icons/icon-location.png",
            onPress: () => onPress("address")),
        ProfileMenu(
            text: "Logout",
            iconAssetUrl: "assets/icons/icon-logout.png",
            onPress: () => onPress("login"))
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
            Consumer<AccountModel>(
                builder: (context, model, child) => Text(
                      model.email,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          letterSpacing: 2),
                    )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _menus(context),
            )
          ],
        ),
      ),
    );
  }
}
