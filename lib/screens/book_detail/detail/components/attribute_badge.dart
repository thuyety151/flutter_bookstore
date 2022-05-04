// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AttributeBadge extends StatelessWidget{
  const AttributeBadge({Key? key}) : super(key: key);


  // AttributeBadge({this.text})
  //
  // final String text;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {}, // Handle your callback
      child: Container(
          margin: const EdgeInsets.only(top: 16),
          // width: double.infinity,
          decoration:const  BoxDecoration(
              // color: buttonColorolor,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: FlatButton(
            onPressed: (){},
            child:const  Text("bi",
                style: TextStyle(
                  // color: textColor,
                )),
          ))
    );
  }
}