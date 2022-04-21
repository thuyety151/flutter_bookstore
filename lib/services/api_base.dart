import "package:http/http.dart" as http;

class Api {
  static const ghnEnpoint =
      'https://dev-online-gateway.ghn.vn/shiip/public-api/master-data';
  static const bookstoreEnpoint = "https://bookwormmm.herokuapp.com/api";

  http.Request getGHN(String requestUrl) {
    Uri url = Uri.parse(ghnEnpoint + requestUrl);
    http.Request request = http.Request("get", url);

// TODO: research how to store secret keys
    request.headers.addAll({"Token": "a907bd6b-3508-11ec-b514-aeb9e8b0c5e3"});
    return request;
  }

  Uri apiUri(String requestUrl) {
    return Uri.parse(bookstoreEnpoint + requestUrl);
  }

  http.Request get(String requestUrl, {String body = ""}) {
    Uri url = Uri.parse(bookstoreEnpoint + requestUrl);
    http.Request request = http.Request("get", url);
    request.headers.addAll({"content-type": "application/json; charset=utf-8"});
    request.body = body;
    return request;
  }

  http.Request post(String requestUrl, {String body = ""}) {
    Uri url = Uri.parse(bookstoreEnpoint + requestUrl);
    http.Request request = http.Request("post", url);
    print(body);
    request.headers.addAll({"content-type": "application/json; charset=utf-8"});
    request.body = body;
    return request;
  }
}
