// import 'dart:html';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_folder/provider/account_model.dart';
import 'package:flutter_folder/routes/index.dart';
import 'package:provider/provider.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key, this.size, this.icon}) : super(key: key);
  final double? size;
  final bool? icon;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: size ?? 80.0,
        backgroundColor: Colors.white,
        child: Consumer<AccountModel>(
            builder: (context, value, child) => CircleAvatar(
                  child: icon ?? false
                      ? Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 20.0,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        RouteManager.ROUTE_IMAGE_PICKER);
                                  },
                                  icon: const Icon(
                                    Icons.camera_alt,
                                    size: 20.0,
                                    color: Color(0xFF404040),
                                  ))),
                        )
                      : null,
                  radius: 76.0,
                  backgroundImage: value.imagePickerPath.isNotEmpty
                      ? FileImage(File(value.imagePickerPath)) as ImageProvider
                      : const NetworkImage(
                          "https://fb-images.saostar.vn/wp700/pc/1646279258920/saostar-q5wjsb0usqn3savs.jpg"),
                )));
  }
}
