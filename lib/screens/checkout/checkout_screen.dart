import 'package:flutter/material.dart';
import 'package:flutter_folder/components/custom_text_style.dart';
import 'package:flutter_folder/screens/checkout/components/checkout_delivery.dart';
import 'package:flutter_folder/screens/checkout/components/checkout_list_item.dart';
import 'package:flutter_folder/screens/checkout/components/checkout_payment_method.dart';

import '../../components/button/primary_button.dart';
import '../../configs/app_colors.dart';
import '../../routes/index.dart';
import 'components/checkout_address.dart';
import 'components/checkout_price_section.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  void onPlaceOrder() {
    // setState(() {
    //   isLoading = true;
    // });
    Navigator.of(context).pushNamed(RouteManager.ROUTE_ORDER_SUCCESS);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Check out"),
          backgroundColor: AppColors.kPrimary
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 10),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              const CheckoutPayment(),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                child: PrimaryButton(
                  onTap: onPlaceOrder,
                  buttonText: "Place Order",
                  buttonColor: const Color.fromARGB(255, 249, 82, 69),
                  textColor: Colors.white,
                  buttonWidth: 200,
                  loading: isLoading,
                ),
              ),
              const SizedBox(height: 50),
            ]),
          ),
        ));
  }
}
