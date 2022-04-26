// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu(
      {Key? key,
      required this.text,
      required this.iconAssetUrl,
      required this.onPress})
      : super(key: key);

  final String text;
  final String iconAssetUrl;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        key: key,
        onPressed: onPress,
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: SizedBox(
          height: 60,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 8),
                    child: Image(
                      image: AssetImage(iconAssetUrl),
                      height: 38,
                    )),
                Text(text),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.chevron_right),
              onPressed: () {},
              padding:const EdgeInsets.all(4),
            )
          ]),
        ));
  }
}
