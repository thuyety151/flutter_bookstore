import 'package:flutter/material.dart';
import '../../configs/size_config.dart';

class IconCounterButton extends StatelessWidget {
  final String svgSrc;
  final int numOfItem;
  final GestureTapCallback press;

  const IconCounterButton({
    Key? key,
    required this.svgSrc,
    this.numOfItem = 0,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(12)),
            height: getProportionateScreenWidth(46),
            width: getProportionateScreenWidth(46),
            decoration: BoxDecoration(
              color: const Color(0xFFFF4848),
              shape: BoxShape.circle,
              border: Border.all(width: 1.5, color: Colors.white),
            ),
            child: Center(
                child: Text(
              "$numOfItem",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(10),
                  height: 1,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            )),
          )
        ],
      ),
    );
  }
}
