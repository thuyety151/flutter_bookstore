// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/provider/book_model.dart';
import 'package:provider/provider.dart';

import '../../../../components/custom_text_style.dart';
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
  late double? price = Provider.of<BookModel>(context, listen: false)
      .detail!
      .attributes!
      .elementAt(0)
      .price;

  late int selectedIndex = 0;

  var quantity = 1;
  late int available =
      Provider.of<BookModel>(context, listen: false).detail!.totalStock ?? 0;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    final isLogin =
        Provider.of<AccountModel>(context, listen: false).getisUserLogedIn();

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
                          const SizedBox(height: 10),
                          Text(
                            'Available: ' + available.toString(),
                            style: CustomTextStyle.textFormFieldLight
                                .copyWith(fontSize: 14),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 250,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("\$${price.toString()}",
                                      style: CustomTextStyle.textFormFieldBold
                                          .copyWith(
                                              color: Colors.red, fontSize: 22)),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Consumer<Cart>(
                                        builder: (context, cart, child) {
                                          return Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10))),
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  InkWell(
                                                    child: const Icon(
                                                        Icons.remove),
                                                    onTap: () {
                                                      if (quantity > 1) {
                                                        setState(() {
                                                          quantity -= 1;
                                                          available += 1;
                                                        });
                                                      }
                                                    },
                                                  ),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5,
                                                            bottom: 3,
                                                            right: 12,
                                                            left: 12),
                                                    child: Text(
                                                      quantity.toString(),
                                                      style: CustomTextStyle
                                                          .textFormFieldSemiBold,
                                                    ),
                                                  ),
                                                  InkWell(
                                                      child:
                                                          const Icon(Icons.add),
                                                      onTap: () {
                                                        if (quantity <
                                                            available) {
                                                          setState(() {
                                                            quantity += 1;
                                                            available -= 1;
                                                          });
                                                        }
                                                      }),
                                                ],
                                              ));
                                        },
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () async {
                                  if (isLogin) {
                                    await cart.addOrUpdateItem(
                                        value.detail?.id ?? "1",
                                        value.detail?.attributes
                                                ?.elementAt(selectedIndex)
                                                .id ??
                                            "1",
                                        quantity);
                                    Navigator.pop(context);

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
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
                  )
                ],
              )),
    );
  }
}
