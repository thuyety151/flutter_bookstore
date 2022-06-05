import 'package:flutter_folder/models/media.dart';

class Category {
  String id;
  String name;
  String slug;
  int subTotal;
  Media? media;
  String? parentId;
  List<Category> subCategories;

  Category(
      {required this.id,
      required this.name,
      required this.media,
      required this.parentId,
      required this.slug,
      required this.subCategories,
      required this.subTotal});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json["id"],
        name: json["name"],
        media: json["media"] != null ? Media.fromJson(json["media"]) : null,
        parentId: json["parentId"],
        slug: json["slug"],
        subCategories: [],
        subTotal: json["subTotal"] ?? 0);
  }
  static Category fromJsonModel(Map<String, dynamic> json) =>
      Category.fromJson(json);
}
