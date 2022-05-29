import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/constants.dart';
// import 'package:flutter_folder/helpers/show_dialog.dart';
import 'package:flutter_folder/main.dart';
import 'package:flutter_folder/routes/index.dart';
import 'package:flutter_folder/services/api_base.dart';
import 'package:flutter_folder/services/api_response_model.dart';
import 'package:http/http.dart' as http;

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

Future withRestApiResponse(String url,
    {String method = "get", String body = "", bool hasLoading = false}) async {
  try {
    //   showLoading();
    final Api _api = Api();
    var request = method == "get"
        ? await _api.get(url)
        : method == "delete"
            ? await _api.delete(url)
            : await _api.post(url, body: body);
    var response = await http.Response.fromStream(await request.send());
    // Navigator.pop(navigatorKey.currentState!.overlay!.context);
    if (response.statusCode == 200) {
      return response.body;
    } else if (response.statusCode == 400) {
      throw response.body;
    }
    if (url.contains("login")) {
      throw kLoginFailed;
    } else {
      Navigator.of(navigatorKey.currentState!.overlay!.context)
          .pushNamed(RouteManager.ROUTE_LOGIN);
    }
    return ApiResponse();
  } catch (e) {
    catchErrAndNotify(
        AlertDialogParams(title: "Login Error", content: e.toString()), e);
    rethrow;
  }
}

Future withGHNApiResponse(String url,
    {String method = "get", String body = ""}) async {
  try {
    // showLoading();
    final Api _api = Api();

    var request = method == "get"
        ? await _api.getGHN(url)
        : await _api.postGHN(url, body: body);
    var response = await http.Response.fromStream(await request.send());
    // Navigator.pop(navigatorKey.currentState!.overlay!.context);
    return response.body;
  } catch (e) {
    catchErrAndNotify(
        AlertDialogParams(title: "Login Error", content: e.toString()), e);
    rethrow;
  }
}
