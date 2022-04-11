import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Rate extends StatefulWidget {
  const Rate({Key? key, this.size, this.rate}) : super(key: key);
  final double? size;
  final int? rate;

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
                index + 1 > (widget.rate ?? 5)
                    ? Icons.star_outline
                    : Icons.star,
                color: Colors.amber[300],
                size: widget.size ?? 12,
              )),
    ));
  }
}
