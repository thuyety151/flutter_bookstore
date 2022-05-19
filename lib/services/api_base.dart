import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import "package:http/http.dart" as http;

class Api {
  static const ghnEnpoint =
      'https://dev-online-gateway.ghn.vn/shiip/public-api';
  static const storage = FlutterSecureStorage();
  static const bookstoreEnpoint = "https://bookwormmm.herokuapp.com/api";
  // static const bookstoreEnpoint = "https://localhost:5001/api";
  // static const bookstoreEnpoint = "https://10.0.2.2:5001/api";

  Uri apiUri(String requestUrl) {
    return Uri.parse(bookstoreEnpoint + requestUrl);
  }

  Future<http.Request> get(String requestUrl, {String body = ""}) async {
    var res = await storage.read(key: "token");

    Uri url = Uri.parse(bookstoreEnpoint + requestUrl);
    http.Request request = http.Request("get", url);
    request.headers.addAll({
      "content-type": "application/json; charset=utf-8",
      "authorization": res != null ? "Bearer $res" : ""
    });
    request.body = body;
    return request;
  }

  Future<http.Request> post(String requestUrl, {String body = ""}) async {
    var res = await storage.read(key: "token");

    Uri url = Uri.parse(bookstoreEnpoint + requestUrl);
    http.Request request = http.Request("post", url);
    request.headers.addAll({
      "content-type": "application/json; charset=utf-8",
      "authorization": res != null ? "Bearer $res" : ""
    });
    request.body = body;
    return request;
  }

  Future<http.Request> delete(String requestUrl, {String body = ""}) async {
    var res = await storage.read(key: "token");

    Uri url = Uri.parse(bookstoreEnpoint + requestUrl);
    http.Request request = http.Request("delete", url);
    request.headers.addAll({
      "content-type": "application/json; charset=utf-8",
      "authorization": res != null ? "Bearer $res" : ""
    });
    request.body = body;
    return request;
  }

  Future<http.Request> getGHN(String requestUrl, {String body = ""}) async {
    Uri url = Uri.parse(ghnEnpoint + requestUrl);
    http.Request request = http.Request("get", url);
    request.headers.addAll({
      "content-type": "application/json; charset=utf-8",
      "Token": "a907bd6b-3508-11ec-b514-aeb9e8b0c5e3"
    });
    request.body = body;
    return request;
  } 
   Future<http.Request> postGHN(String requestUrl, {String body = ""}) async {
    Uri url = Uri.parse(ghnEnpoint + requestUrl);
    http.Request request = http.Request("post", url);
    request.headers.addAll({
      "content-type": "application/json; charset=utf-8",
      "Token": "a907bd6b-3508-11ec-b514-aeb9e8b0c5e3"
    });
    request.body = body;
    return request;
  }
}
