import "package:http/http.dart" as http;

const ghnEnpoint =
    'https://dev-online-gateway.ghn.vn/shiip/public-api/master-data';
const bookstoreEnpoint = "https://bookwormmm.herokuapp.com/api";

http.Request getGHNUri(String requestUrl, String method) {
  Uri url = Uri.parse(ghnEnpoint + requestUrl);
  http.Request request = http.Request(method, url);

// TODO: research how to store secret keys
  request.headers.addAll({"Token": "a907bd6b-3508-11ec-b514-aeb9e8b0c5e3"});
  return request;
}

Uri apiUri(String requestUrl) {
  return Uri.parse(bookstoreEnpoint + requestUrl);
}

http.Request getUri(String requestUrl, String method, String? body) {
  Uri url = Uri.parse(bookstoreEnpoint + requestUrl);
  http.Request request = http.Request(method, url);

// TODO: research how to store secret keys
  request.headers.addAll({"content-type": "application/json; charset=utf-8"});
  request.body = body ?? "";
  print(body);
  return request;
}
