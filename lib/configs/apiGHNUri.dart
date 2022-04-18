import 'dart:convert';

import 'package:flutter_folder/models/ApiResponse.dart';
import "package:http/http.dart" as http;

const GHNEndpoint =
    'https://dev-online-gateway.ghn.vn/shiip/public-api/master-data';

enum HttpMethod { get, post }

http.Request getGHNUri(String requestUrl, String method) {
  Uri url = Uri.parse(GHNEndpoint + requestUrl);
  print(method);

  http.Request request = new http.Request(method, url);

  request.headers.addAll({"Token": "a907bd6b-3508-11ec-b514-aeb9e8b0c5e3"});
  return request;
}
