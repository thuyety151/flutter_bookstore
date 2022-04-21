import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Book {
  String id;
  String name;
  double price;
  double salePrice;
  String pictureUrl;
  String? authorId;
  String? authorName;
  String languageId;
  String languageName;
  String attributeId;
  String attributeName;

  Book({
    required this.id,
    required this.name,
    required this.price,
    required this.salePrice,
    required this.pictureUrl,
    required this.authorId,
    required this.authorName,
    required this.languageId,
    required this.languageName,
    required this.attributeId,
    required this.attributeName,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        id: json["id"],
        name: json["name"],
        price: json["price"].toDouble(),
        salePrice: json["salePrice"].toDouble(),
        pictureUrl: json["pictureUrl"],
        authorId: json["authorId"],
        authorName: json["authorName"] ?? "",
        languageId: json["languageId"],
        languageName: json["languageName"],
        attributeId: json["attributeId"],
        attributeName: json["attributeName"]);
  }

  static Book fromJsonModel(Map<String, dynamic> json) => Book.fromJson(json);
}
