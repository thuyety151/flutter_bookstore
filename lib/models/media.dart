import 'dart:convert';

class Media {
  String id;
  String? name;
  String url;
  bool isMain;
  bool isVideo;

  Media(
      {required this.id,
      required this.name,
      required this.url,
      required this.isMain,
      required this.isVideo});

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
        id: json["id"],
        name: json["name"] ?? "",
        url: json["url"],
        isMain: json["isMain"],
        isVideo: json["isVideo"]);
  }

  String toBodyJson() {
    Map<String, dynamic> map = {
      "id": id,
      "name": name ?? "",
      "url": url,
      "isMain": isMain,
      "isVideo": isVideo,
    };
    return json.encode(map);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name ?? "",
      "url": url,
      "isMain": isMain,
      "isVideo": isVideo,
    };
  }
}
