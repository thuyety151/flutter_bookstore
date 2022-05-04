// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_folder/components/button/primary_button.dart';
import 'package:flutter_folder/components/form/address_picker.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/configs/constants.dart';
import 'package:flutter_folder/mocks/models/address_list.dart';
import 'package:flutter_folder/screens/address/components/card_address.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  Widget _listAddress() {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: listAddress.length,
        itemBuilder: (_, index) {
          return Dismissible(
              key: Key(listAddress[index].id),
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
              child: CardAddress(data: listAddress[index]));
        });
  }

  void showDialog() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
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
            child: Column(children: [
              const AddressPicker(),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: PrimaryButton(
                  onTap: () {},
                  buttonText: "Create",
                  buttonColor: AppColors.kPrimary,
                  fullWidth: true,
                  textColor: Colors.white,
                ),
              )
            ]),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: customAppBar("Addresses"),
        body: SafeArea(
          child: SingleChildScrollView(
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
                _listAddress()
              ]),
            ),
          ),
        ));
  }
}
