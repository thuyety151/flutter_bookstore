import 'package:flutter/cupertino.dart';
import 'package:flutter_folder/configs/constants.dart';
import 'package:flutter_folder/models/book.dart';

class Price extends StatelessWidget {
  const Price({Key? key, required this.book}) : super(key: key);
  final Book? book;

  @override
  Widget build(BuildContext context) {
    return book == null
        ? Container()
        : book!.salePrice != 0
            ? Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(
                  book!.salePrice.toString(),
                  style: AppTextStyles.price,
                ),
                const SizedBox(width: 6),
                Text(
                  book!.price.toString(),
                  style: AppTextStyles.oldPrice,
                )
              ])
            : Text(
                book!.price.toString(),
                style: AppTextStyles.price,
              );
  }
}
