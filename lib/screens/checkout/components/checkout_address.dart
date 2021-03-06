// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_folder/components/custom_text_style.dart';
import 'package:flutter_folder/provider/address_model.dart' as provider;
import 'package:provider/provider.dart';

import '../../../models/address.dart';
import '../../address/components/address_form.dart';
import '../../address/components/card_address.dart';

class CheckoutAddress extends StatefulWidget {
  const CheckoutAddress({Key? key}) : super(key: key);

  @override
  State<CheckoutAddress> createState() => _CheckoutAddressState();
}

class _CheckoutAddressState extends State<CheckoutAddress> {
  Widget _listAddress(BuildContext context) {
    return Consumer<provider.AddressModel>(
        builder: (context, value, child) => ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: value.listAddresses.length,
            itemBuilder: (_, index) {
              return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (DismissDirection direction) {
                    if (direction == DismissDirection.endToStart) {
                      _deleteAddress(value.listAddresses.elementAt(index).id);
                    }
                  },
                  background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      )),
                  child:
                      CardAddress(data: value.listAddresses.elementAt(index)));
            }));
  }

  void _deleteAddress(String? id) {
    Provider.of<provider.AddressModel>(context, listen: false)
        .deleteAddress(id ?? "");
  }

  void createAddress(Address value) async {
    await Provider.of<provider.AddressModel>(context, listen: false)
        .createAddress(value);
     Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<provider.AddressModel>(context, listen: false)
        .getListAddresses();

    void showDialogCreate() {
      showModalBottomSheet<void>(
        context: context,
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            height: 800,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(top: 26, left: 8, right: 8),
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: AddressForm(
                    submit: createAddress,
                  )
                  // const AddressPicker(),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 16),
                  //   child: PrimaryButton(
                  //     onTap: () {},
                  //     buttonText: "Create",
                  //     buttonColor: AppColors.kPrimary,
                  //     fullWidth: true,
                  //     textColor: Colors.white,
                  //   ),
                  // )
                  ),
            ),
          );
        },
      );
    }

    void showDialogEdit() {
      showModalBottomSheet<void>(
        context: context,
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
              height: 800,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(top: 26, left: 8, right: 8),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height -
                            2 * 58 -
                            16 * 4,
                        child: _listAddress(context),
                      )
                    ]),
                  ),
                ),
              ));
        },
      );
    }

    return Container(
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
          padding: const EdgeInsets.only(left: 12, top: 8, right: 12),
          child: Consumer<provider.AddressModel>(
            builder: (context, value, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 6,
                ),
                value.listAddresses
                            .indexWhere((element) => element.isMain == true) !=
                        -1
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text(
                              value.listAddresses
                                  .firstWhere(
                                      (element) => element.isMain == true)
                                  .fullName,
                              style: CustomTextStyle.textFormFieldSemiBold
                                  .copyWith(fontSize: 14),
                            ),
                            Container(
                                margin: const EdgeInsets.only(top: 16),
                                child: Text(
                                  value.listAddresses
                                      .firstWhere(
                                          (element) => element.isMain == true)
                                      .fullAddress,
                                  style: CustomTextStyle.textFormFieldMedium
                                      .copyWith(
                                          fontSize: 13,
                                          color: Colors.grey.shade800),
                                )),
                            const SizedBox(
                              height: 6,
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Mobile : ",
                                    style: CustomTextStyle.textFormFieldMedium
                                        .copyWith(
                                            fontSize: 12,
                                            color: Colors.grey.shade800)),
                                TextSpan(
                                    text: value.listAddresses
                                        .firstWhere(
                                            (element) => element.isMain == true)
                                        .phone,
                                    style: CustomTextStyle.textFormFieldBold
                                        .copyWith(
                                            fontSize: 12, color: Colors.black)),
                              ]),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              color: Colors.grey.shade300,
                              height: 1,
                              width: double.infinity,
                            ),
                          ])
                    : Text(
                        "No address available",
                        style: CustomTextStyle.textFormFieldSemiBold
                            .copyWith(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                Row(children: [
                  const Spacer(
                    flex: 2,
                  ),
                  FlatButton(
                    onPressed: showDialogEdit,
                    child: Text(
                      "Edit Address",
                      style: CustomTextStyle.textFormFieldSemiBold.copyWith(
                          fontSize: 12, color: Colors.indigo.shade700),
                    ),
                  ),
                  const Spacer(flex: 3),
                  Container(
                    height: 20,
                    width: 1,
                    color: Colors.grey,
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                  FlatButton(
                    onPressed: showDialogCreate,
                    child: Text("Add New Address",
                        style: CustomTextStyle.textFormFieldSemiBold.copyWith(
                            fontSize: 12, color: Colors.indigo.shade700)),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
