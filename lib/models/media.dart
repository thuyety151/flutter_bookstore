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
        name: json["name"],
        url: json["url"],
        isMain: json["isMain"],
        isVideo: json["isVideo"]);
  }
}
