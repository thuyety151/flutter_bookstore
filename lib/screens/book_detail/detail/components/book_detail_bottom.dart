// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/screens/book_detail/detail/components/form_add_to_cart.dart';
import 'package:provider/provider.dart';

import '../../../../provider/account_model.dart';
import '../../../../routes/index.dart';

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
          child: const FormAddToCart(),
          decoration: const BoxDecoration(color: Colors.white),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
     final isLogin = Provider.of<AccountModel>(context).getisUserLogedIn();

    return Container(
       padding: EdgeInsets.only(top: 8, bottom: 20),
      //margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: 4,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Expanded(
            child: OutlinedButton(
              onPressed: addToCard,
              child: const Text(
                "ADD TO CART",
                style: TextStyle(color: AppColors.kPrimary),
              ),
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1.0, color: AppColors.kPrimary),
                  backgroundColor: Colors.white),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: FlatButton(
                  onPressed: () {
                                      if (isLogin) {
                                        Navigator.of(context)
                                            .pushNamed(RouteManager.ROUTE_CART);
                                      } else {
                                        Navigator.of(context).pushNamed(
                                            RouteManager.ROUTE_LOGIN);
                                      }
                                    },
                  color: AppColors.kPrimary,
                  child: const Text(
                    "BUY NOW",
                    style: TextStyle(color: Colors.white),
                  )))
        ]),
      ),
    );
  }
}
