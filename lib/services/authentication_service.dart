import 'dart:convert';

import 'package:flutter_folder/configs/constants.dart';
import 'package:flutter_folder/helpers/error_handler.dart';
import 'package:flutter_folder/models/account.dart';
import 'package:flutter_folder/services/api_response_model.dart';
import 'package:flutter_folder/services/api_base.dart';
import 'package:http/http.dart' as http;

class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({required this.email, required this.password});

  String toJson() {
    Map<String, dynamic> map = {
      "email": email.trim(),
      "password": password.trim()
    };
    return json.encode(map);
  }
}

class Authentication {
  final Api _api = Api();

  Future<AuthenResponse> login(LoginRequestModel data) async {
    var request = await _api.post("/account/login", body: data.toJson());
    try {
      var response = await http.Response.fromStream(await request.send());

      if (AuthenResponse.getStatusCode(json.decode(response.body)) == 401) {
        throw kLoginFailed;
      }

      return AuthenResponse.fromJson(
          json.decode(response.body), Account.fromJsonModel);
    } catch (e) {
      catchErrAndNotify(
          AlertDialogParams(title: "Login Error", content: e.toString()), e);
      rethrow;
    }
  }
}
