import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_folder/models/media.dart';
import 'package:flutter_folder/services/api_base.dart';
import "package:http/http.dart" as http;
import 'package:image_picker/image_picker.dart';

class MediaModel extends ChangeNotifier {
  Future<Media> createMedia(XFile file) async {
    var _api = Api();

    Uri url = Uri.parse(_api.bsEndpoint + "/medias");
    http.MultipartRequest request = http.MultipartRequest("post", url);
    request.headers.addAll({
      "content-type": "multipart/form-data",
    });

    http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('file', file.path);
    request.files.add(multipartFile);

    var response = await http.Response.fromStream(await request.send());
    return Media.fromJson(json.decode(response.body)["value"]);
  }
}
