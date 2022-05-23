import 'package:flutter/material.dart';

class Rating extends StatefulWidget {
  const Rating({Key? key, this.size, this.rate, required this.onChange})
      : super(key: key);
  final double? size;
  final int? rate;
  final Function(int) onChange;

  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  void handleRate(int index) {
    widget.onChange(index + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: -8,
      direction: Axis.horizontal,
      children: [
        ...List.generate(
            widget.rate ?? 5,
            (index) => IconButton(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  key: Key("icon-rating-$index"),
                  iconSize: widget.size ?? 12,
                  color: Colors.amber[300],
                  onPressed: () => handleRate(index),
                  icon: const Icon(Icons.star),
                )),
        ...List.generate(
            5 - (widget.rate ?? 5),
            (index) => IconButton(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  iconSize: widget.size ?? 12,
                  color: Colors.amber[300],
                  onPressed: () => handleRate((widget.rate ?? 0) + index),
                  icon: const Icon(Icons.star_outline),
                ))
      ],
    );
  }
}
