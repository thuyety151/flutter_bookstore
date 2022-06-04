import 'package:flutter/material.dart';
import 'package:flutter_folder/models/media.dart';
import 'package:flutter_folder/routes/index.dart';

List<String> sampleData = [
  "https://vcdn.tikicdn.com/media/catalog/product/i/m/img893_3.jpg",
  "http://isach.info/images/story/cover/harry_potter_va_chiec_coc_lua__j_k_rowling.jpg",
  "https://i0.wp.com/sachhay.luatnbs.com/wp-content/uploads/2016/11/Chapter-3-harry-potter-and-the-prisoner-of-azkaban.jpg?fit=600%2C898&ssl=1",
  "https://cdn0.fahasa.com/media/catalog/product/h/a/harry_potter_and_the_deathly_hallows_hardcover_1_2018_10_27_11_22_09.jpg",
  "https://vcdn.tikicdn.com/media/catalog/product/i/m/img893_3.jpg",
  "http://isach.info/images/story/cover/harry_potter_va_chiec_coc_lua__j_k_rowling.jpg",
  "https://i0.wp.com/sachhay.luatnbs.com/wp-content/uploads/2016/11/Chapter-3-harry-potter-and-the-prisoner-of-azkaban.jpg?fit=600%2C898&ssl=1",
];

class ListImagesReview extends StatefulWidget {
  const ListImagesReview({Key? key, required this.value}) : super(key: key);

  final List<Media> value;

  @override
  ListImagesReviewState createState() => ListImagesReviewState();
}

class ListImagesReviewState extends State<ListImagesReview> {
  void _viewDetail() {
    Navigator.of(context).pushNamed(RouteManager.ROUTE_IMAGES_DETAIL);
  }

  Widget _moreImages() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.black),
        width: 70,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(
                image: NetworkImage(widget.value.elementAt(3).url),
                color: Colors.black.withOpacity(0.6),
                colorBlendMode: BlendMode.dstATop,
                height: 100,
                fit: BoxFit.fitHeight,
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 24,
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(direction: Axis.horizontal, spacing: 4, children: [
      ...List.generate(
          widget.value.length,
          (index) => GestureDetector(
              onTap: _viewDetail,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        widget.value.elementAt(index).url,
                        height: 100,
                      ))))),
      if (widget.value.length > 4) ...[_moreImages()]
    ]);
  }
}
