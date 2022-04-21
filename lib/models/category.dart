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
        media: Media.fromJson(json["media"]),
        parentId: json["parentId"],
        slug: json["slug"],
        // TODO: Parse list sub category
        subCategories: [],
        subTotal: json["subTotal"]);
  }
  static Category fromJsonModel(Map<String, dynamic> json) =>
      Category.fromJson(json);
}
