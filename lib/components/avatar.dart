import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key, this.size, this.icon}) : super(key: key);
  final double? size;
  final bool? icon;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: size ?? 80.0,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          child: icon ?? false
              ? const Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20.0,
                      child: Icon(
                        Icons.camera_alt,
                        size: 20.0,
                        color: Color(0xFF404040),
                      )),
                )
              : null,
          radius: 76.0,
          backgroundImage: const NetworkImage(
              "https://fb-images.saostar.vn/wp700/pc/1646279258920/saostar-q5wjsb0usqn3savs.jpg"),
        ));
  }
}
