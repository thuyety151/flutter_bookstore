import 'package:flutter/material.dart';
import 'package:flutter_folder/components/custom_text_style.dart';
import 'package:flutter_folder/provider/shipping.dart';
import 'package:flutter_folder/screens/checkout/components/checkout_delivery.dart';
import 'package:flutter_folder/screens/checkout/components/checkout_list_item.dart';
import 'package:flutter_folder/screens/checkout/components/checkout_payment_method.dart';
import 'package:provider/provider.dart';

import '../../components/button/primary_button.dart';
import '../../configs/app_colors.dart';
import '../../models/address.dart';
import '../../models/coupon.dart';
import '../../provider/cart.dart';
import '../../provider/coupons.dart';
import '../../provider/order.dart';
import '../../provider/shipping_fee.dart';
import '../../routes/index.dart';
import '../momo_payment/momo_screen.dart';
import 'components/checkout_address.dart';
import 'components/checkout_price_section.dart';
import 'package:flutter_folder/provider/address_model.dart' as provider;

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  var _isInit = true;
  var _isLoading = false;
  bool _isSelectedMoMo = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<provider.AddressModel>(context, listen: false)
          .getListAddresses()
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  num calTotal(num subtotal, num shippingFee, num coupon) {
    return (subtotal + shippingFee - coupon);
  }

  void onChangePaymentMethod(bool isSelectedMoMo){
    setState(() {
      _isSelectedMoMo = isSelectedMoMo;
    });
  }

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

  Future<void> onPlaceOrder() async {
    final itemIds = Provider.of<Cart>(context, listen: false)
        .items
        .map((item) => item.id as String)
        .toList();
    final currentAddress =
        Provider.of<provider.AddressModel>(context, listen: false).defaulAddress;
    final cart = Provider.of<Cart>(context, listen: false);
    final serviceType =
        Provider.of<Shipping>(context, listen: false).getDefaultServiceType();
    final serviceFee =
        Provider.of<ShippingFee>(context, listen: false).serviceFee;
    final coupon = Provider.of<Coupons>(context, listen: false).selectedCoupon;
    var paymentMethod = _isSelectedMoMo ? 'Payment with MoMo' : 'Cash on delivery';
    final totalAmount = calTotal(cart.totalAmount, (serviceFee / 23000),
        calculateCouponMoney(cart.totalAmount, coupon));

    String orderId = await Provider.of<Order>(context, listen: false).createOrder(
        itemIds,
        currentAddress.id as String,
        currentAddress,
        totalAmount,
        serviceType,
        paymentMethod,
        cart.items);

    if (_isSelectedMoMo){
      Navigator.pushNamed(
      context,
      MoMoPaymentScreen.routeName,
      arguments: ScreenArguments(
        amount: totalAmount.toInt(),
        orderId: orderId,
        username:currentAddress.fullName
      ),
    );
    }
    else {
    Navigator.of(context).pushNamed(RouteManager.ROUTE_ORDER_SUCCESS);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Check out"),
            backgroundColor: AppColors.kPrimary),
        body: Container(
          margin: const EdgeInsets.only(left: 10),
          child: SingleChildScrollView(
            child: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : (Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        const SizedBox(height: 10),
                        Text(
                          "Address",
                          style: CustomTextStyle.textFormFieldMedium.copyWith(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        const CheckoutAddress(),
                        const SizedBox(height: 10),
                        Text(
                          "Shipping Method",
                          style: CustomTextStyle.textFormFieldMedium.copyWith(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        const CheckoutDelivery(),
                        const SizedBox(height: 10),
                        Text(
                          "Items",
                          style: CustomTextStyle.textFormFieldMedium.copyWith(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        const CheckoutList(),
                        Text(
                          "Price",
                          style: CustomTextStyle.textFormFieldMedium.copyWith(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        const CheckoutPriceSection(),
                        const SizedBox(height: 10),
                        Text(
                          "Payment",
                          style: CustomTextStyle.textFormFieldMedium.copyWith(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Consumer<provider.AddressModel>(
                          builder: (context, value, child) => CheckoutPayment(
                              districtId: value.listAddresses
                                  .firstWhere(
                                      (element) => element.isMain == true)
                                  .districtID,
                                  onChangePaymentMethod: onChangePaymentMethod,
                                  isSelectedMoMo: _isSelectedMoMo,
                                  ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          alignment: Alignment.center,
                          child: PrimaryButton(
                            onTap: onPlaceOrder,
                            buttonText: "Place Order",
                            buttonColor: const Color.fromARGB(255, 249, 82, 69),
                            textColor: Colors.white,
                            buttonWidth: 200,
                            loading: _isLoading,
                          ),
                        ),
                        const SizedBox(height: 50),
                      ])),
          ),
        ));
  }
}
