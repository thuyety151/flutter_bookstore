import 'package:flutter/material.dart';

class SessionTitle extends StatelessWidget {
  const SessionTitle({Key? key, required this.title, this.padding})
      : super(key: key);
  final String title;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Text(
        title,
        style:const  TextStyle(
            fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),
      ),
    );
  }
}
