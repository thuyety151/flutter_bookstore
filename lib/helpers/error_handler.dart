import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folder/main.dart';

class AlertDialogParams {
  final String? title;
  final String? content;
  final String? txtConfirm;
  final String? txtCancel;
  final bool? hasCancel;
  const AlertDialogParams(
      {this.content,
      this.title,
      this.txtCancel,
      this.txtConfirm,
      this.hasCancel});
}

void catchErrAndNotify(AlertDialogParams params, dynamic error) {
  showDialog(
      context: navigatorKey.currentState!.overlay!.context,
      builder: (BuildContext context) => CupertinoAlertDialog(
            title: Text(params.title ?? ""),
            content: Text(params.content ?? ""),
            actions: <Widget>[
              if (params.hasCancel != null && params.hasCancel == true) ...[
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text(params.txtCancel ?? "Cancel"),
                ),
              ],
              CupertinoDialogAction(
                onPressed: () =>
                    Navigator.pop(navigatorKey.currentState!.overlay!.context),
                child: Text(params.txtConfirm ?? "OK"),
              )
            ],
          ));
}
