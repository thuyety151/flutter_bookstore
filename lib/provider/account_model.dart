import 'package:flutter/cupertino.dart';
import 'package:flutter_folder/models/account.dart';
import 'package:flutter_folder/services/authentication_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AccountModel extends ChangeNotifier {
  final Authentication _auth = Authentication();
  bool fetching = false;

  late Account _account;

  String get email => _account.email;

  Future<bool> login(LoginRequestModel data) async {
    fetching = true;
    try {
      var response = await _auth.login(data);

      fetching = false;
      _account = Account.fromAuthen(response);
      const storage = FlutterSecureStorage();
      storage.write(key: "token", value: response.token);
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }
}
