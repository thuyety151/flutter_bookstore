import 'package:flutter/cupertino.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';

List<String> imageList = [
  "https://www.cgv.vn/media/banner/cache/1/b58515f018eb873dafa430b6f9ae0c1e/m/o/morbius-980x448.jpg",
  "https://www.cgv.vn/media/banner/cache/1/b58515f018eb873dafa430b6f9ae0c1e/9/8/980x448__1_.jpg",
  "https://www.cgv.vn/media/banner/cache/1/b58515f018eb873dafa430b6f9ae0c1e/s/o/sonic_980_x_448.jpg",
  "https://www.cgv.vn/media/banner/cache/1/b58515f018eb873dafa430b6f9ae0c1e/b/a/bad-guys-980_x_448__1_.jpg",
  "https://www.cgv.vn/media/banner/cache/1/b58515f018eb873dafa430b6f9ae0c1e/c/r/cracked_980wx448h_1_.jpg",
];

class AppBanner extends StatelessWidget {
  const AppBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return GFCarousel(
      autoPlay: true,
      hasPagination: true,
      viewportFraction: 1.0,
      aspectRatio: 2,
      items: imageList.map((url) {
        return Container(
          margin: EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Image.network(url, fit: BoxFit.cover, width: 1000.0),
          ),
        );
      }).toList(),
    );
  }
}
