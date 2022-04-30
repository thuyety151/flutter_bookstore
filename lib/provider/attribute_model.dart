import 'package:flutter/foundation.dart';
import 'package:flutter_folder/models/attribute.dart';
import 'package:flutter_folder/services/attribute_api.dart';

class AttributeModel extends ChangeNotifier {
  final AttributeApi _api = AttributeApi();
  List<Attribute> attributes = [];

  Future<void> getListAttribute() async {
    if (attributes.isEmpty) {
      var res = await _api.getListAttribute();
      attributes = res.data as List<Attribute>;
    }
    notifyListeners();
  }
}
