import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_folder/components/custom_text_style.dart';
import 'package:flutter_folder/components/form/outlined_input.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/configs/constants.dart';
import 'package:flutter_folder/models/item.dart';
import 'package:flutter_folder/models/review.dart';
import 'package:flutter_folder/provider/account_model.dart';
import 'package:flutter_folder/provider/review_provider.dart';
import 'package:flutter_folder/screens/review/components/rating.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

List<String> imgUrls = [
  "https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/c/o/conan_24_-_main_poster_1_.jpg",
  "https://www.cgv.vn/media/catalog/product/cache/3/image/1800x/71252117777b696995f01934522c402d/r/s/rsz_conan_2019_poster_-_final-01.jpg",
  "https://www.cgv.vn/media/catalog/product/cache/1/image/1800x/71252117777b696995f01934522c402d/c/o/conan_2018_-_localized_poster406.jpg",
  "https://vnmedia.vn/file/8a10a0d36ccebc89016ce0c6fa3e1b83/old_image/201808/original/diem-qua-nhung-bo-phim-conan-da-tung-ra-mat-khan-gia-viet-2212008.jpg",
  "https://vnmedia.vn/file/8a10a0d36ccebc89016ce0c6fa3e1b83/old_image/201808/original/diem-qua-nhung-bo-phim-conan-da-tung-ra-mat-khan-gia-viet-2212008.jpg"
      "https://vnmedia.vn/file/8a10a0d36ccebc89016ce0c6fa3e1b83/old_image/201808/original/diem-qua-nhung-bo-phim-conan-da-tung-ra-mat-khan-gia-viet-2212008.jpg"
];

class ReviewFormValue {
  String bookId;
  String id;
  int rate;
  String content;
  String title;
  List<XFile> files;

  ReviewFormValue(
      {required this.bookId,
      required this.content,
      required this.rate,
      required this.files,
      required this.id,
      required this.title});
}

class ReviewForm extends StatefulWidget {
  const ReviewForm(
      {Key? key,
      required this.item,
      required this.isSubmit,
      required this.totalItem})
      : super(key: key);
  final Item item;
  final bool isSubmit;
  final int totalItem;

  @override
  _ReviewFormState createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  var uuid = new Uuid();

  late Review formValue = Review(
      bookId: widget.item.productId ?? "",
      content: "",
      rate: 5,
      // TODO: replace userName by current user name after merging code wooth feature profile
      title: "userName",
      id: uuid.v4(),
      updateDate: "",
      createDate: "",
      files: [],
      media: []);

  final BoxDecoration _containerStyles = const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)), color: Colors.white);

  @override
  void didChangeDependencies() {
    print("watch  ... ${widget.isSubmit}");
    super.didChangeDependencies();
  }

  Future getImagefromGallery() async {
    var _imagePicker = ImagePicker();

    var image = await _imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        formValue.files = [...?formValue.files, image];
      }
    });
  }

  Widget _listMedia(BuildContext context) {
    return SizedBox(
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 8,
              direction: Axis.horizontal,
              children: List.generate(
                  formValue.files!.length,
                  (index) => Image.file(
                        File(
                          formValue.files!.elementAt(index).path,
                        ),
                        height: MediaQuery.of(context).size.width / 3,
                      )),
            )));
  }

  Widget itemInfo(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 2 * 16;

    return Container(
      width: width - 2 * 16,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(
            16,
          ))),
      child: Row(children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(14)),
              color: Colors.blue.shade200,
              image: DecorationImage(
                image: NetworkImage(widget.item.pictureUrl ?? ""),
              )),
        ),
        Expanded(
            child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 8, top: 4),
                  child: Text(
                    widget.item.productName ?? "",
                    maxLines: 2,
                    softWrap: true,
                    style: CustomTextStyle.textFormFieldSemiBold
                        .copyWith(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "${widget.item.attributeName}",
                  style: CustomTextStyle.textFormFieldRegular
                      .copyWith(color: Colors.grey, fontSize: 14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "x${widget.item.quantity}",
                      style: CustomTextStyle.textFormFieldRegular
                          .copyWith(color: Colors.grey),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "\$ " + widget.item.price!.toStringAsFixed(2),
                              style: CustomTextStyle.textFormFieldSemiBold,
                            ),
                          ],
                        ))
                  ],
                )
              ]),
        ))
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 2 * 16;
    if (widget.isSubmit == true) {
      Provider.of<ReviewProvider>(context, listen: false)
          .submitSingleReview(formValue, widget.totalItem, () {
        Navigator.pop(context);
      });
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(color: Colors.white),
      child: Wrap(direction: Axis.vertical, spacing: 18, children: [
        itemInfo(context),
        Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            width: MediaQuery.of(context).size.width - 16 * 2,
            alignment: Alignment.center,
            child: Rating(
              size: 28,
              rate: formValue.rate,
              onChange: (value) {
                setState(() {
                  formValue.rate = value;
                });
              },
            )),
        Container(
            width: width - 2 * 16,
            decoration: _containerStyles,
            alignment: Alignment.center,
            child: OutlinedInput(
              maxLines: 5,
              modelValue: formValue.content,
              onUpdateValue: (value) {
                setState(() {
                  formValue.content = value;
                });
              },
              placeholder: "Input your reviews",
            )),
        GestureDetector(
          onTap: getImagefromGallery,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            width: width - 2 * 16,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(color: AppColors.kDarkGrey)),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.cloud_upload_outlined,
                  color: AppColors.kTextGrey,
                  size: 32,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Click here to upload",
                  style: AppTextStyles.caption,
                )
              ],
            ),
          ),
        ),
        SizedBox(
            width: width - 2 * 16,
            // padding: EdgeInsets.only(top: 16),
            child: _listMedia(context)),
        const SizedBox(
          height: 16,
        )
      ]),
    );
  }
}
