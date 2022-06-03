import 'package:flutter/cupertino.dart';
import 'package:flutter_folder/configs/constants.dart';
import 'package:flutter_folder/models/attribute.dart';
import 'package:flutter_folder/models/book.dart';

class Price extends StatelessWidget {
  const Price({Key? key, this.book, this.attr}) : super(key: key);
  final Book? book;
  final Attribute? attr;

  @override
  Widget build(BuildContext context) {
    final model = book ?? attr as dynamic;
    return model == null
        ? Container()
        : model?.salePrice != 0 && model?.salePrice != null
            ? Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(
                  model!.salePrice.toString(),
                  style: AppTextStyles.price,
                ),
                const SizedBox(width: 6),
                Text(
                  model!.price.toString(),
                  style: AppTextStyles.oldPrice,
                )
              ])
            : Text(
                model!.price.toString(),
                style: AppTextStyles.price,
              );
  }
}
