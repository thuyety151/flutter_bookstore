import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folder/routes/index.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';

List<String> imgUrls = [
  "https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/c/o/conan_24_-_main_poster_1_.jpg",
  "https://www.cgv.vn/media/catalog/product/cache/3/image/1800x/71252117777b696995f01934522c402d/r/s/rsz_conan_2019_poster_-_final-01.jpg",
  "https://www.cgv.vn/media/catalog/product/cache/1/image/1800x/71252117777b696995f01934522c402d/c/o/conan_2018_-_localized_poster406.jpg",
  "https://vnmedia.vn/file/8a10a0d36ccebc89016ce0c6fa3e1b83/old_image/201808/original/diem-qua-nhung-bo-phim-conan-da-tung-ra-mat-khan-gia-viet-2212008.jpg"
];

class BookListImage extends StatefulWidget {
  const BookListImage({Key? key}) : super(key: key);

  @override
  _BookListImageState createState() => _BookListImageState();
}

class _BookListImageState extends State<BookListImage> {
  late int currentIndex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      currentIndex = 0;
    });
  }

  void _viewDetail() {
    Navigator.of(context).pushNamed(RouteManager.ROUTE_IMAGES_DETAIL);
  }

  Widget _slider() {
    return Container(
        child: Stack(
      children: [
        GFCarousel(
          viewportFraction: 1.0,
          aspectRatio: 2,
          onPageChanged: (int value) => {setState(() => currentIndex = value)},
          items: imgUrls.map((url) {
            return Container(
              margin: EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                  // width: 1000.0,
                  height: double.infinity,
                ),
              ),
            );
          }).toList(),
        ),
        Positioned(
          bottom: 8,
          right: 16,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: Colors.black26,
            ),
            child: Text(
              (currentIndex + 1).toString() + "/${imgUrls.length}",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
              height: 200,
              alignment: Alignment.center,
              child: Container(
                height: 28,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: Colors.black54,
                ),
                child: Text(
                  "Out of stock",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              )),
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _viewDetail,
      child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [_slider()],
          )),
    );
  }
}