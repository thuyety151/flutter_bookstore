import 'dart:convert';

import 'package:flutter_folder/services/api_response_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Account {
  late String id;
  late String firstName;
  late String lastName;
  late String email;
  late String? photoUrl;
  static const storage = FlutterSecureStorage();

  Account(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      this.photoUrl});

  Account.empty() {
    email = "";
    firstName = "";
    lastName = "";
    photoUrl = "";
  }

  Account.fromAuthen(AuthenResponse auth) {
    id = "1";
    email = auth.email;
    firstName = auth.firstName ?? "";
    lastName = auth.lastName ?? "";
    photoUrl = auth.photoUrl ?? "";
  }

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
        id: json["id"] ?? "",
        firstName: json["firstName"] ?? "",
        lastName: json["lastName"] ?? "",
        photoUrl: json["photoUrl"] ?? "",
        email: json["email"] ?? "");
  }

  static Account fromJsonModel(Map<String, dynamic> json) =>
      Account.fromJson(json);

  String toBodyJson() {
    Map<String, dynamic> map = {
      "firstName": firstName,
      "lastName": lastName,
    };
    return json.encode(map);
  }
}
