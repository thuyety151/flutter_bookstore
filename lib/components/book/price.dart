import 'package:flutter/cupertino.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/configs/constants.dart';
import 'package:flutter_folder/models/attribute.dart';
import 'package:flutter_folder/models/book.dart';

class Price extends StatelessWidget {
  const Price({Key? key, this.book, this.attr, this.fontSize})
      : super(key: key);
  final Book? book;
  final Attribute? attr;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final model = book ?? attr as dynamic;
    return model == null
        ? Container()
        : model?.salePrice != 0 && model?.salePrice != null
            ? Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(
                  model!.salePrice.toString(),
                  style: fontSize != null
                      ? TextStyle(
                          fontSize: fontSize,
                          color: AppColors.kPrimary,
                          fontWeight: FontWeight.bold)
                      : AppTextStyles.price,
                ),
                const SizedBox(width: 6),
                Container(
                  padding: EdgeInsets.only(bottom: fontSize != null ? 4 : 0),
                  child: Text(
                    model!.price.toString(),
                    style: AppTextStyles.oldPrice,
                  ),
                )
              ])
            : Text(
                model!.price.toString(),
                style: fontSize != null
                    ? TextStyle(
                        fontSize: fontSize,
                        color: AppColors.kPrimary,
                        fontWeight: FontWeight.bold)
                    : AppTextStyles.price,
              );
  }
}
