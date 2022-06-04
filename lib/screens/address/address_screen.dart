// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/configs/constants.dart';
import 'package:flutter_folder/models/address.dart';
import 'package:flutter_folder/provider/address_model.dart' as provider;
import 'package:flutter_folder/screens/address/components/address_form.dart';
import 'package:flutter_folder/screens/address/components/card_address.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  void _deleteAddress(String? id) {
    Provider.of<provider.AddressModel>(context, listen: false)
        .deleteAddress(id ?? "");
  }

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

  void createAddress(Address value) {
    Provider.of<provider.AddressModel>(context, listen: false)
        .createAddress(value);
  }

  void showDialog() {
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

  @override
  Widget build(BuildContext context) {
    Provider.of<provider.AddressModel>(context,listen: false).getListAddresses();

    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: customAppBar("Ship Addresses"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: FlatButton(
                  height: 58,
                  color: AppColors.kBgPrimary,
                  onPressed: showDialog,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: const SizedBox(
                    width: double.infinity,
                    child: Icon(
                      Icons.add,
                      color: AppColors.kPrimary,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: AppColors.kPrimary,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 2 * 58 - 16 * 4,
                child: _listAddress(context),
              )
            ]),
          ),
        ));
  }
}
