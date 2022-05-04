import 'package:flutter_folder/configs/constants.dart';

enum ValidationName { required, ruleEmail }

class Validation {
  String? value;
  String? message;
  Validation({this.value, this.message});

  String? required(String? value, String? message) {
    if (value == null || value.isEmpty) {
      return message ?? kNotNullError;
    }
    return null;
  }

  String? ruleEmail(String? value, String? message) {
    if (value != null && !emailValidatorRegExp.hasMatch(value)) {
      return message ?? kInvalidEmailError;
    }
    return null;
  }

  String? getValidatorByName(ValidationName name, String? value,
      {String? message}) {
    switch (name) {
      case ValidationName.required:
        return required(value, message);
      case ValidationName.ruleEmail:
        return ruleEmail(value, message);
      default:
        return null;
    }
  }
}
