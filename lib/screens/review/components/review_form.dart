import 'package:flutter/material.dart';
import 'package:flutter_folder/components/form/outlined_input.dart';
import 'package:flutter_folder/components/rate.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/configs/constants.dart';

List<String> imgUrls = [
  "https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/c/o/conan_24_-_main_poster_1_.jpg",
  "https://www.cgv.vn/media/catalog/product/cache/3/image/1800x/71252117777b696995f01934522c402d/r/s/rsz_conan_2019_poster_-_final-01.jpg",
  "https://www.cgv.vn/media/catalog/product/cache/1/image/1800x/71252117777b696995f01934522c402d/c/o/conan_2018_-_localized_poster406.jpg",
  "https://vnmedia.vn/file/8a10a0d36ccebc89016ce0c6fa3e1b83/old_image/201808/original/diem-qua-nhung-bo-phim-conan-da-tung-ra-mat-khan-gia-viet-2212008.jpg",
  "https://vnmedia.vn/file/8a10a0d36ccebc89016ce0c6fa3e1b83/old_image/201808/original/diem-qua-nhung-bo-phim-conan-da-tung-ra-mat-khan-gia-viet-2212008.jpg"
      "https://vnmedia.vn/file/8a10a0d36ccebc89016ce0c6fa3e1b83/old_image/201808/original/diem-qua-nhung-bo-phim-conan-da-tung-ra-mat-khan-gia-viet-2212008.jpg"
];

class ReviewForm extends StatelessWidget {
  const ReviewForm({Key? key}) : super(key: key);

  Widget _listMedia(BuildContext context) {
    return SizedBox(
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 8,
              direction: Axis.horizontal,
              children: List.generate(
                  imgUrls.length,
                  (index) => Image(
                        height: MediaQuery.of(context).size.width / 3,
                        image: NetworkImage(imgUrls[index]),
                      )),
            )));
  }

  @override
  Widget build(BuildContext context) {
    BoxDecoration _containerStyles = const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white);

    return Wrap(direction: Axis.vertical, spacing: 18, children: [
      const Text("Rating", style: AppTextStyles.title),
      Container(
          padding: const EdgeInsets.symmetric(vertical: 18),
          width: MediaQuery.of(context).size.width - 16 * 2,
          decoration: _containerStyles,
          alignment: Alignment.center,
          child: const Rate(size: 24)),
      const Text("Write your reviews", style: AppTextStyles.title),
      Container(
          width: MediaQuery.of(context).size.width - 16 * 2,
          decoration: _containerStyles,
          alignment: Alignment.center,
          child: OutlinedInput(
            maxLines: 5,
            onUpdateValue: (value) {},
            placeholder: "Input your reviews",
          )),
      const Text("Upload photos or videos", style: AppTextStyles.title),
      Container(
          padding: const EdgeInsets.symmetric(vertical: 24),
          width: MediaQuery.of(context).size.width - 16 * 2,
          decoration: _containerStyles,
          alignment: Alignment.center,
          child: Column(
            children: const [
              Icon(
                Icons.cloud_upload_outlined,
                color: AppColors.kTextGrey,
                size: 32,
              ),
              Text(
                "Click here to upload",
                style: AppTextStyles.caption,
              )
            ],
          )),
      SizedBox(
          width: MediaQuery.of(context).size.width,
          // padding: EdgeInsets.only(top: 16),
          child: _listMedia(context)),
    ]);
  }
}
