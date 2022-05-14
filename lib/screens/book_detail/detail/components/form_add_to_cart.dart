import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/configs/constants.dart';
import 'package:flutter_folder/provider/book_model.dart';
import 'package:provider/provider.dart';

import '../../../../provider/account_model.dart';
import '../../../../provider/cart.dart';
import '../../../../routes/index.dart';

class FormAddToCartValue {
  String? attributeId;
  int? quantity;

  FormAddToCartValue({this.attributeId, this.quantity});
}

class FormAddToCart extends StatefulWidget {
  const FormAddToCart({Key? key}) : super(key: key);

  @override
  _FormAddToCartState createState() => _FormAddToCartState();
}

class _FormAddToCartState extends State<FormAddToCart> {
  late FormAddToCartValue formValue = FormAddToCartValue();
  late double? price =
      Provider.of<BookModel>(context).detail!.attributes!.elementAt(0).price;

  late int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final isLogin = Provider.of<AccountModel>(context).getisUserLogedIn();
    return Container(
      height: 300,
      padding: const EdgeInsets.all(16),
      child: Consumer<BookModel>(
          builder: (context, value, child) => Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        image: NetworkImage(
                            value.detail!.media!.elementAt(0).url.toString()),
                        height: 142,
                        width: 88,
                        fit: BoxFit.fitHeight,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width - 9 * 16,
                              alignment: Alignment.topLeft,
                              child: Wrap(
                                direction: Axis.horizontal,
                                spacing: 8,
                                children: List.generate(
                                    value.detail!.attributes!.length,
                                    (index) => OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                              side: BorderSide(
                                                  width: 1.0,
                                                  color: index == selectedIndex
                                                      ? AppColors.kPrimary
                                                      : Colors.black38),
                                              backgroundColor:
                                                  index == selectedIndex
                                                      ? AppColors.kPrimary
                                                      : Colors.white),
                                          onPressed: () {
                                            setState(() {
                                              print(value.detail!.attributes!
                                                  .elementAt(index)
                                                  .price);
                                              selectedIndex = index;
                                              price = value.detail!.attributes!
                                                  .elementAt(index)
                                                  .price;
                                            });
                                          },
                                          child: Text(
                                            value.detail!.attributes!
                                                .elementAt(index)
                                                .name,
                                            style: TextStyle(
                                                color: index == selectedIndex
                                                    ? Colors.white
                                                    : AppColors.kTextGrey),
                                          ),
                                        )),
                              )),
                          Text("\$${price.toString()}",
                              style: AppTextStyles.price)
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 38,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  if (isLogin) {
                                    cart.addOrUpdateItem(
                                        value.detail?.id ?? "1",
                                        value.detail?.attributes
                                                ?.elementAt(selectedIndex)
                                                .id ??
                                            "1",
                                        1);
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          "Add item to cart successfully!"),
                                      duration: Duration(seconds: 1),
                                    ));
                                  } else {
                                    Navigator.of(context)
                                        .pushNamed(RouteManager.ROUTE_LOGIN);
                                  }
                                },
                                child: const Text(
                                  "ADD TO CART",
                                  style: TextStyle(color: AppColors.kPrimary),
                                ),
                                style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        width: 1.0, color: AppColors.kPrimary),
                                    backgroundColor: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: FlatButton(
                                    onPressed: () {},
                                    color: AppColors.kPrimary,
                                    child: const Text(
                                      "BUY NOW",
                                      style: TextStyle(color: Colors.white),
                                    )))
                          ]),
                    ),
                  )
                ],
              )),
    );
  }
}
