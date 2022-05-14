import 'package:flutter/material.dart';
import 'package:flutter_folder/components/custom_text_style.dart';
import 'package:flutter_folder/screens/checkout/components/checkout_delivery.dart';
import 'package:flutter_folder/screens/checkout/components/checkout_list_item.dart';
import 'package:flutter_folder/screens/checkout/components/checkout_payment_method.dart';
import 'package:provider/provider.dart';

import '../../components/button/primary_button.dart';
import '../../configs/app_colors.dart';
import '../../models/address.dart';
import '../../routes/index.dart';
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
  late Address currentAddress;

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
      Provider.of<provider.AddressModel>(context).getListAddresses().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
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
            backgroundColor: AppColors.kPrimary),
        body: Container(
          margin: const EdgeInsets.only(left: 10),
          child: SingleChildScrollView(
            child: _isLoading
                ? Center(
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
                        Consumer<provider.AddressModel>(builder: (context, value, child) => CheckoutPayment(districtId: value.listAddresses.firstWhere((element) => element.isMain == true).districtID),),
                        
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
