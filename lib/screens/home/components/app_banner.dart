import 'package:flutter/cupertino.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';

List<String> imageList = [
  "https://www.cgv.vn/media/banner/cache/1/b58515f018eb873dafa430b6f9ae0c1e/m/o/morbius-980x448.jpg",
  "https://www.cgv.vn/media/banner/cache/1/b58515f018eb873dafa430b6f9ae0c1e/9/8/980x448__1_.jpg",
  "https://www.cgv.vn/media/banner/cache/1/b58515f018eb873dafa430b6f9ae0c1e/s/o/sonic_980_x_448.jpg",
  "https://www.cgv.vn/media/banner/cache/1/b58515f018eb873dafa430b6f9ae0c1e/b/a/bad-guys-980_x_448__1_.jpg",
  "https://www.cgv.vn/media/banner/cache/1/b58515f018eb873dafa430b6f9ae0c1e/c/r/cracked_980wx448h_1_.jpg",
];

const listBanner = [
  "https://res.cloudinary.com/dnjhqv3qw/image/upload/v1653322747/mppgfvrev0r1aqudb2tc.png",
  "https://res.cloudinary.com/dnjhqv3qw/image/upload/v1653322814/wonzsgksj6manrzsyxq3.png",
  "https://res.cloudinary.com/dnjhqv3qw/image/upload/v1653322862/uvcim4cpsym5tgpw5gxz.png",
  "https://res.cloudinary.com/dnjhqv3qw/image/upload/v1653322983/fkvitecn4ujpdwe1kvl9.png"
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
      items: listBanner.map((url) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Image.network(url, fit: BoxFit.cover, width: 1000.0),
          ),
        );
      }).toList(),
    );
  }
}
