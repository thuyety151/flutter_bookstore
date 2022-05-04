import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/routes/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  void navWithPermission(BuildContext context, String routeName) async {
    const storage = FlutterSecureStorage();
    var token = await storage.read(key: "token");
    if (token == null) {
      Navigator.of(context).pushNamed(RouteManager.ROUTE_LOGIN);
    } else {
      Navigator.of(context).pushNamed(routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Shop Icon.svg",
                  color: MenuState.home == selectedMenu
                      ? AppColors.kPrimary
                      : inActiveIconColor,
                ),
                onPressed: () => Navigator.of(context)
                    .pushNamed(RouteManager.ROUTE_HOME_PAGE),
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/Heart Icon.svg"),
                onPressed: () {},
              ),
              IconButton(
                  icon: SvgPicture.asset("assets/icons/Chat bubble Icon.svg"),
                  onPressed: () =>
                      navWithPermission(context, RouteManager.ROUTE_CHAT)),
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/User Icon.svg",
                    color: MenuState.profile == selectedMenu
                        ? AppColors.kPrimary
                        : inActiveIconColor,
                  ),
                  onPressed: () =>
                      navWithPermission(context, RouteManager.ROUTE_PROFILE)),
            ],
          )),
    );
  }
}
