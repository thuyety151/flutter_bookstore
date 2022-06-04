import 'package:flutter_folder/helpers/format.dart';
import 'package:flutter_folder/mocks/book_list.dart';
import 'package:flutter_folder/models/attribute.dart';
import 'package:flutter_folder/models/media.dart';
import 'package:flutter_folder/models/review.dart';

class Book {
  String id;
  String name;
  double price;
  double salePrice;
  String? pictureUrl;
  String? authorId;
  String? authorName;
  String languageId;
  String? languageName;
  String? attributeId;
  String? attributeName;
  String? shortDescription;
  String? description;
  int? viewCount;
  List<Media>? media;
  List<Attribute> attributes;
  String? dimensions;
  String? publicationDate;
  String? publisher;
  String? publicationCountry;
  String? stockStatus; 
  int? totalStock;
  bool? isPublic;
  String? updateDate;
  List<String>? categoryIds;
  List<Review> reviews;

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
    required this.attributes,
    required this.reviews,
  });

  Book.detail(
      {required this.id,
      required this.name,
      required this.shortDescription,
      required this.description,
      required this.price,
      required this.salePrice,
      required this.viewCount,
      required this.media,
      required this.authorId,
      required this.authorName,
      required this.attributes,
      required this.languageId,
      required this.languageName,
      required this.dimensions,
      required this.publicationDate,
      required this.publisher,
      required this.publicationCountry,
      required this.stockStatus,
      required this.totalStock,
      required this.isPublic,
      required this.updateDate,
      required this.categoryIds,
      required this.reviews});

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
        attributes: [],
        reviews: [],
        attributeName: json["attributeName"]);
  }

  factory Book.detailFromJson(Map<String, dynamic> json) {
    final listAttrs = json["attributes"].cast<Map<String, dynamic>>() ?? [];
    final listMedia = json["media"].cast<Map<String, dynamic>>() ?? [];

    return Book.detail(
        id: json["id"],
        name: json["name"],
        shortDescription: json["shortDescription"],
        description: json["description"],
        price: json["price"].toDouble(),
        salePrice: json["salePrice"].toDouble(),
        viewCount: json["viewCount"],
        media: List<Media>.from(listMedia.map((e) => Media.fromJson(e))),
        authorId: json["authorId"],
        authorName: json["authorName"],
        attributes:
            List<Attribute>.from(listAttrs.map((e) => Attribute.fromJson(e))),
        languageId: json["languageId"],
        languageName: json["languageName"] ?? json["language"],
        dimensions: json["dimensions"],
        publicationDate:
            format(DateTime.parse(json["publicationDate"]), "dd/MM/yyyy"),
        publisher: json["publisher"],
        publicationCountry: json["publicationCountry"],
        stockStatus: json["stockStatus"],
        totalStock: json["totalStock"],
        isPublic: json["isPublic"],
        updateDate: json["updateDate"],
        categoryIds: [],
        reviews: []
        // List<String>.from(listCategoryId.map((e) => e.toString()))
        );
  }

  List<InfoModel> getBookInfo() {
    return [
      InfoModel("Publication date", publicationDate ?? ""),
      InfoModel("Publisher", publisher ?? ""),
      InfoModel("Publication Country", publicationCountry ?? ""),
      InfoModel("Language", languageName ?? ""),
      InfoModel("Book Author", authorName ?? ""),
      InfoModel("Dimension", dimensions ?? "")
    ];
  }

  static Book fromJsonModel(Map<String, dynamic> json) => Book.fromJson(json);
  static Book detailFromJsonModel(Map<String, dynamic> json) =>
      Book.detailFromJson(json);
}
