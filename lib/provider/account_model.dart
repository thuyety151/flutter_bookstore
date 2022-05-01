import 'package:flutter/cupertino.dart';
import 'package:flutter_folder/models/account.dart';
import 'package:flutter_folder/services/authentication_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AccountModel extends ChangeNotifier {
  final Authentication _auth = Authentication();
  bool fetching = false;
   bool _userLogedIn = false;

  late Account _account;

  String get email => _account.email;

  Future<bool> login(LoginRequestModel data) async {
    fetching = true;
    var response = await _auth.login(data);
    fetching = false;
    if (response.token != null) {
      _account = Account.fromAuthen(response);
      final storage = FlutterSecureStorage();
      storage.write(key: "token", value: response.token);
       _userLogedIn = true;
      notifyListeners();
      return true;
    }
    
    return false;
  }

    Account getUserLoginDetails() => _account;
    bool getisUserLogedIn() {
    return _userLogedIn;
  }

}
