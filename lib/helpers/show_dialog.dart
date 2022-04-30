import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future showLoading(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => Center(
      child: Container(
          alignment: Alignment.center,
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(children: const [
              Text(
                "Loading",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    decoration: TextDecoration.none),
              ),
              SizedBox(
                height: 16,
              ),
              CupertinoActivityIndicator(
                color: Colors.white,
              )
            ]),
          )),
    ),
  );
}
