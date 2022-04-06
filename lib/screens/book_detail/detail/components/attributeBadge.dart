import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AttributeBadge extends StatelessWidget{

  // AttributeBadge({this.text})
  //
  // final String text;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {}, // Handle your callback
      child: Container(
          margin: EdgeInsets.only(top: 16),
          // width: double.infinity,
          decoration: BoxDecoration(
              // color: buttonColorolor,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: FlatButton(
            onPressed: (){},
            child: Text("bi",
                style: TextStyle(
                  // color: textColor,
                )),
          ))
    );
  }
}