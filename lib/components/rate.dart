import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Rate extends StatefulWidget {
  const Rate({Key? key}) : super(key: key);

  @override
  _RateState createState() => _RateState();
}

class _RateState extends State<Rate> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Wrap(
      direction: Axis.horizontal,
      children: List.generate(
          5,
          (index) => Icon(
                Icons.star,
                color: Colors.amber[300],
                size: 12,
              )),
    ));
  }
}
