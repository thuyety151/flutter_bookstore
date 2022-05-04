// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    this.onTap,
    this.borderRadius,
    this.buttonColor,
    this.textColor,
    this.borderColor,
    this.buttonWidth,
    this.buttonHeight,
    this.buttonMargin,
    required this.buttonText,
    this.loading,
    this.fullWidth,
    this.filled,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onTap;
  final Color? buttonColor;
  final double? borderRadius;
  final Color? textColor;
  final String buttonText;
  final Color? borderColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final EdgeInsets? buttonMargin;
  final bool? loading;
  final bool? fullWidth;
  final bool? filled;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        // margin: EdgeInsets.only(top: 16),
        margin: buttonMargin,
        width: fullWidth ?? false ? double.infinity : buttonWidth,
        height: buttonHeight,
        decoration: BoxDecoration(
            color: filled ?? false ? AppColors.kPrimary : buttonColor,
            borderRadius: const BorderRadius.all(Radius.circular(50))),
        child: FlatButton(
          onPressed: onTap,
          child: loading == true
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(buttonText,
                  style: TextStyle(
                    color: textColor,
                  )),
        ));
  }
}
