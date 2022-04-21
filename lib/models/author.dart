class Author {
  String id;
  String name;
  String imageUrl;

  Author({required this.id, required this.name, required this.imageUrl});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
        id: json["id"], name: json["name"], imageUrl: json["imageUrl"]);
  }

  static Author fromJsonModel(Map<String, dynamic> json) =>
      Author.fromJson(json);
}
