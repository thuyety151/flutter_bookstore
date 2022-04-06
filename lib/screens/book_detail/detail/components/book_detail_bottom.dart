import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/screens/book_detail/detail/components/form_add_to_cart.dart';

class BookDetailBottom extends StatefulWidget {
  const BookDetailBottom({Key? key}) : super(key: key);

  @override
  _BookDetailBottomState createState() => _BookDetailBottomState();
}

class _BookDetailBottomState extends State<BookDetailBottom> {
  void addToCard() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          child: FormAddToCart(),
          decoration: BoxDecoration(color: Colors.white),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: 4,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Expanded(
            child: OutlinedButton(
              onPressed: addToCard,
              child: Text(
                "ADD TO CART",
                style: TextStyle(color: AppColors.kPrimary),
              ),
              style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1.0, color: AppColors.kPrimary),
                  backgroundColor: Colors.white),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
              child: FlatButton(
                  onPressed: () {},
                  color: AppColors.kPrimary,
                  child: Text(
                    "BUY NOW",
                    style: TextStyle(color: Colors.white),
                  )))
        ]),
      ),
    );
  }
}
