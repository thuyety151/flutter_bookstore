import 'package:flutter/material.dart';
import 'package:flutter_folder/components/button/primary_button.dart';
import 'package:flutter_folder/components/form/address_picker.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/models/address.dart';
import 'package:flutter_folder/screens/address/components/address_form.dart';

class CardAddress extends StatefulWidget {
  const CardAddress({Key? key, required this.data}) : super(key: key);

  final Address data;

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
                      modelValue: widget.data,
                      submit: (value) {},
                    ))
                // child: Column(children: [
                //   AddressPicker(
                //     emitValue: (value) {},
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.only(top: 16),
                //     child: PrimaryButton(
                //       onTap: () {},
                //       buttonText: "Update",
                //       buttonColor: AppColors.kPrimary,
                //       fullWidth: true,
                //       textColor: Colors.white,
                //     ),
                //   )
                // ]),
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
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          if (widget.data.isMain == true) ...[
            const Image(
                image: AssetImage("assets/icons/icon-check.png"), height: 20),
          ] else ...[
            const SizedBox(
              height: 20,
              width: 20,
            )
          ],
          const SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.data.fullName,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.data.phone.toString(),
                style: const TextStyle(color: AppColors.kTextGrey),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 128,
                child: Text(
                  widget.data.fullAddress,
                  style:
                      const TextStyle(color: AppColors.kTextGrey, fontSize: 13),
                ),
              )
            ],
          ),
        ]),
        Container(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: _editAddress,
              child: const Image(
                  image: AssetImage("assets/icons/icon-edit-grey.png"),
                  height: 24),
            ))
      ]),
    );
  }
}
