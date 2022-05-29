// import 'dart:html';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_folder/provider/account_model.dart';
import 'package:flutter_folder/routes/index.dart';
import 'package:provider/provider.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key, this.size, this.icon, this.isEdit}) : super(key: key);
  final double? size;
  final bool? icon;
  final bool? isEdit;

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
                backgroundImage: isEdit != null ||
                        isEdit == false ||
                        value.imagePickerPath.isEmpty
                    ? NetworkImage(value.account.photoUrl.isNotEmpty
                        ? value.account.photoUrl.toString()
                        : "https://firebasestorage.googleapis.com/v0/b/internship-august-2021-b1566.appspot.com/o/my-drive%2FFrame%2010%20(1).png?alt=media&token=ea263bdb-85f8-4d50-b68e-d202c804a45b")
                    : FileImage(File(value.imagePickerPath))
                        as ImageProvider)));
  }
}
