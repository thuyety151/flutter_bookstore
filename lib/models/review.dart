import 'package:flutter_folder/models/media.dart';
import 'package:flutter_folder/screens/review/components/review_form.dart';
import 'package:image_picker/image_picker.dart';

class Review {
  late String id;
  late String bookId;
  late String title;
  late String content;
  late int rate;
  late String createDate;
  late String updateDate;
  late List<Media> media;
  late List<XFile>? files;

  Review(
      {required this.content,
      required this.createDate,
      required this.id,
      required this.media,
      required this.rate,
      required this.bookId,
      required this.files,
      required this.title,
      required this.updateDate});

  Review.fromForm(ReviewFormValue data, List<Media> medias) {
    id = data.id;
    content = data.content;
    rate = data.rate;
    title = data.title;
    media = medias;
    createDate = DateTime.now().toString();
  }

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        rate: json["rate"],
        createDate: json["createDate"],
        updateDate: json["updateDate"],
        media: json["media"],
        bookId: '',
        files: []);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
        "media": media,
        "rate": rate,
        "title": title,
        "bookId": bookId,
        "createDate": DateTime.now().toIso8601String(),
        "updateDate": DateTime.now().toIso8601String()
      };
}
