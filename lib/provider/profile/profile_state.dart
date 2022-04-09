import 'package:flutter/foundation.dart';
import 'package:flutter_folder/models/profile.dart';

class ProfileState with ChangeNotifier {
  // TODO: remove this sample code
  Profile profile = Profile("thuyety15@gmail.com", "Thuyet Y");

  void update(Profile newProfile) {
    profile = newProfile;
    notifyListeners();
  }
}
