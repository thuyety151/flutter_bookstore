import 'package:flutter/material.dart';
import 'package:flutter_folder/models/ghn/service-type.dart';
import 'package:flutter_folder/provider/address_model.dart';
import 'package:provider/provider.dart';

import '../../../components/custom_text_style.dart';
import '../../../models/coupon.dart';
import '../../../provider/cart.dart';
import '../../../provider/coupons.dart';
import '../../../provider/shipping.dart';
import '../../../provider/shipping_fee.dart';

class CheckoutPriceSection extends StatelessWidget {
  const CheckoutPriceSection({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final currentAddress =
        Provider.of<AddressModel>(context, listen: false).defaulAddress;

    final serviceType =
        Provider.of<Shipping>(context, listen: false).serviceTypes.firstWhere(
              (element) => element.isMain == true,
              orElse: () => ServiceType(isMain: false),
            );

    Provider.of<ShippingFee>(context, listen: false)
        .getFee(currentAddress, serviceType);

    var coupon = Provider.of<Coupons>(context, listen: false).selectedCoupon;

    double calculateCouponMoney(double subtotal, Coupon coupon) {
      // discountType:  0.FixedCart, 1.Percentage
      if (coupon.discountType == 0) {
        return coupon.couponAmount.toDouble();
      } else {
        if (coupon.discountType == 1) {
          return subtotal * (coupon.couponAmount / 100);
        }
      }
      return 0;
    }

    return Consumer<ShippingFee>(
        builder: (context, value, child) => Container(
              margin: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: Card(
                elevation: 0,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      border: Border.all(color: Colors.grey.shade200)),
                  padding: const EdgeInsets.only(
                      left: 12, top: 8, right: 12, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      createPriceItem(
                          "Subtotal",
                          "\$${cart.totalAmount.toStringAsFixed(2)}",
                          Colors.grey.shade700),
                      createPriceItem(
                          "Shipping",
                          "\$${formatVNDtoUSD(value.serviceFee)}",
                          Colors.teal.shade300),
                      createPriceItem(
                          "Discount",
                          "- \$${calculateCouponMoney(cart.totalAmount, coupon).toStringAsFixed(2)}",
                          Colors.red.shade300),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: double.infinity,
                        height: 0.5,
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Total",
                            style: CustomTextStyle.textFormFieldSemiBold
                                .copyWith(color: Colors.black, fontSize: 18),
                          ),
                          Text(
                            "\$${calTotal(cart.totalAmount, (value.serviceFee / 23000), calculateCouponMoney(cart.totalAmount, coupon))}",
                            style: CustomTextStyle.textFormFieldSemiBold
                                .copyWith(color: Colors.red, fontSize: 18),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}

createPriceItem(String key, String value, Color color) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 3),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          key,
          style: CustomTextStyle.textFormFieldMedium
              .copyWith(color: Colors.black, fontSize: 14),
        ),
        Text(
          value,
          style: CustomTextStyle.textFormFieldMedium
              .copyWith(color: color, fontSize: 16),
        )
      ],
    ),
  );
}

formatVNDtoUSD(num money) {
  return (money / 23000).toStringAsFixed(2);
}

calTotal(num subtotal, num shippingFee, num coupon) {
  return (subtotal + shippingFee - coupon).toStringAsFixed(2);
}
