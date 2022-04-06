import 'package:flutter/cupertino.dart';
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
        padding: EdgeInsets.symmetric(vertical: 0),
        child: Container(
          height: 60,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Image(
                      image: AssetImage(iconAssetUrl),
                      height: 38,
                    )),
                Text(text),
              ],
            ),
            IconButton(
              icon: new Icon(Icons.chevron_right),
              onPressed: () {},
              padding: EdgeInsets.all(4),
            )
          ]),
        ));
  }
}
