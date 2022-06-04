// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/button/primary_button.dart';
import '../../../components/custom_text_style.dart';
import '../../../models/coupon.dart';
import '../../../provider/account_model.dart';
import '../../../provider/coupons.dart';
import '../../../routes/index.dart';

class CouponItem extends StatelessWidget {
  final Coupon coupon;
  final bool isUserCoupon;
  final Function() notifyParent;
  final bool isSelection;
  CouponItem(
      this.coupon, this.isUserCoupon, this.notifyParent, this.isSelection,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _isLogin = Provider.of<AccountModel>(context).getisUserLogedIn();
    return Stack(
      children: [
        Container(
          width: isUserCoupon ? double.infinity : 244,
          height: 174,
          margin: EdgeInsets.only(
              left: isUserCoupon ? 16 : 5, right: isUserCoupon ? 16 : 5),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(
                16,
              ))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                width: isUserCoupon ? double.infinity : 220,
                height: 105,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(14)),
                    color: Colors.blue.shade200,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(coupon.imageUrl),
                    )),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: 20, top: 5, right: isUserCoupon ? 20 : 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 160,
                            child: Text(
                              coupon.description,
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyle.textFormFieldSemiBold
                                  .copyWith(fontSize: isUserCoupon ? 14 : 12),
                            ),
                          ),
                          isUserCoupon
                              ? Text(
                                  "Min spend: \$" + coupon.minSpend.toString(),
                                  maxLines: 2,
                                  softWrap: true,
                                  style: CustomTextStyle.textFormFieldRegular
                                      .copyWith(
                                          fontSize: isUserCoupon ? 10 : 8),
                                )
                              : const SizedBox(),
                          Text(
                            "#Expired date: " +
                                coupon.expireDate.split('T').first,
                            maxLines: 2,
                            softWrap: true,
                            style: CustomTextStyle.textFormFieldLight
                                .copyWith(fontSize: 10),
                          ),
                        ]),
                    isUserCoupon
                        ? PrimaryButton(
                            onTap: isSelection ? null : notifyParent,
                            buttonText: "Apply",
                            buttonColor: const Color.fromARGB(255, 249, 82, 69),
                            textColor: Colors.white,
                            buttonWidth: 75,
                            buttonHeight: 27,
                            borderRadius: 8,
                            //loading: isLoading,
                          )
                        : IconButton(
                            onPressed: () async {
                              if (_isLogin) {
                                var result = await Provider.of<Coupons>(context,
                                        listen: false)
                                    .saveUserCoupon(coupon.id);

                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(result),
                                  duration: const Duration(seconds: 1),
                                ));
                              } else {
                                Navigator.of(context)
                                    .pushNamed(RouteManager.ROUTE_LOGIN);
                              }
                            },
                            icon: const Icon(
                              Icons.copy,
                              size: 17.0,
                              color: Color(0xFF404040),
                            ))
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
