import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_folder/configs/constants.dart';
import 'package:flutter_folder/helpers/error_handler.dart';
import 'package:flutter_folder/models/account.dart';
import 'package:flutter_folder/services/api_response_model.dart';
import 'package:flutter_folder/services/api_base.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

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

class RegisterRequestModel {
  String firstName;
  String lastName;
  String email;
  String password;

  RegisterRequestModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password});

  String toJson() {
    Map<String, dynamic> map = {
      "firstName": firstName.trim(),
      "lastName": lastName.trim(),
      "email": email.trim(),
      "password": password.trim()
    };
    return json.encode(map);
  }
}

class Authentication {
  final Api _api = Api();
  final _auth = FirebaseAuth.instance;

  Future<AuthenResponse> login(LoginRequestModel data) async {
    var request = await _api.post("/account/login", body: data.toJson());
    try {
      var response = await http.Response.fromStream(await request.send());

      if (AuthenResponse.getStatusCode(json.decode(response.body)) == 401) {
        throw kLoginFailed;
      }

      // try {
      //   UserCredential authResult;
      //   authResult = await _auth.signInWithEmailAndPassword(
      //     email: data.email,
      //     password: data.password,
      //   );
      // } on PlatformException catch (err) {
      //   var message = 'An error occurred, pelase check your credentials!';

      //   if (err.message != null) {
      //     message = err.message.toString();
      //   }
      //   catchErrAndNotify(
      //       AlertDialogParams(title: "Login Error", content: message), err);
      //   rethrow;
      // }

try {
        UserCredential authResult;
        authResult = await _auth.createUserWithEmailAndPassword(
          email: data.email,
          password: data.password,
        );
      } on PlatformException catch (err) {
        var message = 'An error occurred, pelase check your credentials!';

        if (err.message != null) {
          message = err.message.toString();
        }
        catchErrAndNotify(
            AlertDialogParams(title: "Register Error", content: message), err);
        rethrow;
      }
      return AuthenResponse.fromJson(
          json.decode(response.body), Account.fromJsonModel);
    } on FormatException catch (e) {
      catchErrAndNotify(
          AlertDialogParams(title: "Login Error", content: e.source), e);
      rethrow;
    }
  }

  Future<AuthenResponse> register(RegisterRequestModel data) async {
    var request = await _api.post("/account/register", body: data.toJson());
    try {
      var response = await http.Response.fromStream(await request.send());

      if (AuthenResponse.getStatusCode(json.decode(response.body)) == 401) {
        throw kRegisterFailed;
      }

       try {
        UserCredential authResult;
        authResult = await _auth.createUserWithEmailAndPassword(
          email: data.email,
          password: data.password,
        );
      } on PlatformException catch (err) {
        var message = 'An error occurred, pelase check your credentials!';

        if (err.message != null) {
          message = err.message.toString();
        }
        catchErrAndNotify(
            AlertDialogParams(title: "Register Error", content: message), err);
        rethrow;
      }

      return AuthenResponse.fromJson(
          json.decode(response.body), Account.fromJsonModel);
    } on FormatException catch (e) {
      catchErrAndNotify(
          AlertDialogParams(title: "Register Error", content: e.source), e);
      rethrow;
    }
  }
}
