import 'package:flutter/material.dart';
import 'package:flutter_folder/components/avatar.dart';
import 'package:flutter_folder/screens/profile/components/profile_menu.dart';

import '../../routes/index.dart';
import 'components/stats_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget _menus() {
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
            onPress: () => onPress),
        ProfileMenu(
            text: "Addresses",
            iconAssetUrl: "assets/icons/icon-location.png",
            onPress: () => onPress("address")),
        ProfileMenu(
            text: "Wishlist",
            iconAssetUrl: "assets/icons/icon-wish-list.png",
            onPress: () => onPress("wishlist")),
        ProfileMenu(
            text: "Logout",
            iconAssetUrl: "assets/icons/icon-logout.png",
            onPress: () => onPress)
      ],
    );
  }

  Widget _statsCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StatsCard(),
        SizedBox(width: 8),
        StatsCard(),
        SizedBox(width: 8),
        StatsCard(),
      ],
    );
  }

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
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        letterSpacing: 2),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: _statsCard(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: _menus(),
                )
              ],
            ),
          ),
        ));
  }
}
