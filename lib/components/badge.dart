import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/constants.dart';

class Badge extends StatelessWidget {
  const Badge({
    Key? key,
    required this.child,
    required this.value,
    this.color,
    this.textColor,
  }) : super(key: key);

  final Widget child;
  final String value;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
            right: 2,
            top: 2,
            child: Container(
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: color ?? kPrimaryColor,
              ),
              constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: textColor),
              ),
            ))
      ],
    );
  }
}
