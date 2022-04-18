import 'package:flutter/material.dart';
import 'package:flutter_folder/components/custom_text_style.dart';
import 'package:flutter_folder/screens/checkout/components/checkout_delivery.dart';
import 'package:flutter_folder/screens/checkout/components/checkout_item.dart';
import 'package:flutter_folder/screens/checkout/components/checkout_list_item.dart';
import 'package:flutter_folder/screens/checkout/components/checkout_payment_method.dart';

import '../../components/button/primary_button.dart';
import '../../routes/index.dart';
import 'components/checkout_address.dart';
import 'components/checkout_price_section.dart';

class CheckoutScreen extends StatefulWidget {
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
    Navigator.of(context).pushNamed(RouteManager.ROUTE_CHECKOUT);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Check out"),
        ),
        body: Container(
          margin: EdgeInsets.only(left:5),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 10),
              Text(
                "Address",
                style: CustomTextStyle.textFormFieldMedium.copyWith(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              CheckoutAddress(),
                SizedBox(height: 10),
              Text(
                "Shipping Method",
                style: CustomTextStyle.textFormFieldMedium.copyWith(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              CheckoutDelivery(),
                SizedBox(height: 10),
              Text(
                "Items",
                style: CustomTextStyle.textFormFieldMedium.copyWith(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              CheckoutList(),
              CheckoutPriceSection(),
                SizedBox(height: 10),
              Text(
                "Payment",
                style: CustomTextStyle.textFormFieldMedium.copyWith(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              CheckoutPayment(),
              SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                child: PrimaryButton(
                  onTap: onPlaceOrder,
                  buttonText: "Place Order",
                  buttonColor: Color.fromARGB(255, 249, 82, 69),
                  textColor: Colors.white,
                  buttonWidth: 200,
                  loading: isLoading,
                ),
              ),
              SizedBox(height: 50),
            ]),
          ),
        ));
  }
}
