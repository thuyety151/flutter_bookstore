import 'package:flutter_folder/models/media.dart';

class Review {
  String id;
  String title;
  String content;
  int rate;
  String createDate;
  String updateDate;
  List<Media> media;

  Review(
      {required this.content,
      required this.createDate,
      required this.id,
      required this.media,
      required this.rate,
      required this.title,
      required this.updateDate});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        rate: json["rate"],
        createDate: json["createDate"],
        updateDate: json["updateDate"],
        media: []);
  }
}
