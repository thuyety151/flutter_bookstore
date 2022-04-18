import 'dart:convert';

class LoginResponseModel {
  final String? token;
  final String? error;

  LoginResponseModel({this.token, this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
        token: json["token"] ?? "", error: json["error"] ?? "");
  }
}

class LoginRequestModel {
  String? email;
  String? password;

  LoginRequestModel({this.email, this.password});

  String toJson() {
    Map<String, dynamic> map = {
      "email": email!.trim(),
      "password": password!.trim()
    };
    return json.encode(map);
  }
}