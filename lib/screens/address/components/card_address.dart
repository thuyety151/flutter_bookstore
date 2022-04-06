import 'package:flutter/material.dart';
import 'package:flutter_folder/components/button/primary_button.dart';
import 'package:flutter_folder/components/form/address_picker.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/mocks/models/addressList.dart';

class CardAddress extends StatefulWidget {
  const CardAddress({Key? key, required this.data}) : super(key: key);

  final AddressModel data;

  @override
  _CardAddressState createState() => _CardAddressState();
}

class _CardAddressState extends State<CardAddress> {
  void _editAddress() {
    showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            height: 800,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                color: Colors.white),
            child: Padding(
              padding: EdgeInsets.only(top: 26, left: 8, right: 8),
              child: Column(children: [
                AddressPicker(),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: PrimaryButton(
                    onTap: () {},
                    buttonText: "Update",
                    buttonColor: AppColors.kPrimary,
                    fullWidth: true,
                    textColor: Colors.white,
                  ),
                )
              ]),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.kBgGgrey),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          child: Row(children: [
            if (widget.data.isMain == true) ...[
              Image(
                  image: AssetImage("assets/icons/icon-check.png"), height: 20),
            ] else ...[
              Container(
                height: 20,
                width: 20,
              )
            ],
            SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Home",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.data.phone,
                  style: TextStyle(color: AppColors.kTextGrey),
                ),
                Text(
                  widget.data.fullAddress(),
                  style: TextStyle(color: AppColors.kTextGrey, fontSize: 13),
                )
              ],
            ),
          ]),
        ),
        Container(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: _editAddress,
              child: Image(
                  image: AssetImage("assets/icons/icon-edit-grey.png"),
                  height: 24),
            ))
      ]),
    );
  }
}
