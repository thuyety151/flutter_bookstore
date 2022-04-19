import 'dart:convert';

import 'package:flutter_folder/configs/api_uri.dart';
import 'package:flutter_folder/models/api_response_model.dart';
import 'package:flutter_folder/models/core/Account.dart';
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

class AccountApi {
  Future<AuthenResponse> login(LoginRequestModel data) async {
    try {
      http.Request request =
          await getUri("/account/login", "post", data.toJson());

      var response = await http.Response.fromStream(await request.send());
      print(response.body);
      return AuthenResponse.fromJson(
          json.decode(response.body), Account.fromJsonModel);
    } catch (e) {
      throw Exception(e);
    }
  }
}
