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
    return Wrap(
      direction: Axis.horizontal,
      children: [
        ...List.generate(
            widget.rate ?? 5,
            (index) => Icon(
                  Icons.star,
                  color: Colors.amber[300],
                  size: widget.size ?? 12,
                )),
        ...List.generate(
            5 - (widget.rate ?? 5),
            (index) => Icon(
                  Icons.star_outline,
                  color: Colors.amber[300],
                  size: widget.size ?? 12,
                ))
      ],
    );
  }
}
