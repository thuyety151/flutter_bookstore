import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_folder/helpers/error_handler.dart';
import 'package:flutter_folder/models/media.dart';
import 'package:flutter_folder/models/review.dart';
import 'package:flutter_folder/services/api_base.dart';
import "package:http/http.dart" as http;

class ReviewProvider extends ChangeNotifier {
  late int countSubmission = 0;
  late List<Review> reviews = [];

  Future<void> submitSingleReview(
      Review data, int itemsLength, Function onSuccess) async {
    // upload files
    var listMedia = await Future.wait(data.files!.map((e) async {
      var _api = Api();

      Uri url = Uri.parse(_api.bsEndpoint + "/medias");
      http.MultipartRequest request = http.MultipartRequest("post", url);
      request.headers.addAll({
        "content-type": "multipart/form-data",
      });

      http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath('file', e.path);
      request.files.add(multipartFile);

      var response = await http.Response.fromStream(await request.send());
      return Media.fromJson(json.decode(response.body)["value"]);
    }));
    data.media = listMedia;
    var resSubmit = await withRestApiResponse("/reviews",
        method: "post", body: json.encode(data.toJson()));
    if (json.decode(resSubmit)["isSuccess"] == true) {
      countSubmission += 1;
      notifyListeners();
    }
    if (countSubmission == itemsLength) {
      countSubmission = 0;
      onSuccess();
    }
  }
}
