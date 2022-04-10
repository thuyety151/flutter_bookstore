import 'package:flutter/cupertino.dart';

// includes title, icon view all and list book with horizontal scroll bar
class ListBookSession extends StatelessWidget {
  const ListBookSession(
      {Key? key, required this.title, required this.child, this.header})
      : super(key: key);

  final String title;
  final Widget child;
  final Widget? header;

  Widget _title(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 16, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1),
          ),
          Image(
            image: AssetImage("assets/icons/icon-view-all.png"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _title(title),
        if (header != null) ...[
          Container(
            child: header,
          )
        ],
        SizedBox(
            child: Container(
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal, child: child))),
      ],
    );
  }
}
