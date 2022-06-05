import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_folder/helpers/error_handler.dart';
import 'package:flutter_folder/models/account.dart';
import 'package:flutter_folder/screens/profile/components/form_change_password.dart';
import 'package:flutter_folder/services/authentication_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'media_model.dart';

class AccountModel extends ChangeNotifier {
  final Authentication _auth = Authentication();
  bool fetching = false;

  late Account _account = Account.empty();
  static const storage = FlutterSecureStorage();
  late XFile _file;
  Account get account => _account;
  String get imagePickerPath => _file.path;

  String get email => _account.email;

  AccountModel() {
    getUserLoginDetails();
    _file = XFile("");
  }

  Future<bool> login(LoginRequestModel data) async {
    fetching = true;
    try {
      var response = await _auth.login(data);

      fetching = false;
      _account = Account.fromAuthen(response);
      storage.deleteAll();
      storage.write(key: "token", value: response.token);
      storage.write(key: "firstName", value: response.firstName);
      storage.write(key: "lastName", value: response.lastName);
      storage.write(key: "email", value: response.email);
      storage.write(key: "photoUrl", value: response.photoUrl);
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> register(RegisterRequestModel data) async {
    fetching = true;
    try {
      var response = await _auth.register(data);

      fetching = false;
      _account = Account.fromAuthen(response);
      const storage = FlutterSecureStorage();
      storage.write(key: "token", value: response.token);

      await login(
          LoginRequestModel(email: data.email, password: data.password));
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Account> getUserLoginDetails() async {
    Map<String, String> allValues = await storage.readAll();

    _account.email = allValues["email"] ?? "";
    _account.firstName = allValues["firstName"] ?? "";
    _account.lastName = allValues["lastName"] ?? "";
    _account.photoUrl = allValues["photoUrl"] ?? "";
    notifyListeners();

    return _account;
  }

  bool getisUserLogedIn() {
    return _account.email.isNotEmpty;
  }

  Future<void> updateProfile(Account value, VoidCallback onSuccess) async {
    try {
      var media =
          _file.path.isNotEmpty ? await MediaModel().createMedia(_file) : null;

      var res = await withRestApiResponse("/account/update-account-information",
          method: "post",
          body: json.encode({
            "firstName": _account.firstName,
            "lastName": _account.lastName,
            "photo": media
          }));
      if (json.decode(res)["firstName"] != null) {
        onSuccess();
        // reset storage
        await storage.write(
            key: "firstName", value: json.decode(res)["firstName"]);
        await storage.write(
            key: "lastName", value: json.decode(res)["lastName"]);
        if (json.decode(res)["photoUrl"] != "") {
          await storage.write(
              key: "photoUrl", value: json.decode(res)["photoUrl"]);
        }
        await getUserLoginDetails();
      }
    } catch (e) {
      rethrow;
    }
  }

  void setImage(XFile file) {
    _file = file;
    notifyListeners();
  }

  Future<void> changePassword(
      ChangePWValue value, VoidCallback onSuccess) async {
    try {
      var res = await withRestApiResponse("/account/update-account-password",
          method: "post", body: value.toUpdateBodyJson());
      if (json.decode(res)["isSuccess"] != null) {
        onSuccess();
      }
    } catch (e) {
      // catchErrAndNotify(
      //     AlertDialogParams(title: "Change Password", content: e.toString()),
      //     e);
      rethrow;
    }
  }

  void resetAvatarState() {
    // imagePickerPath = "";
  }
}
