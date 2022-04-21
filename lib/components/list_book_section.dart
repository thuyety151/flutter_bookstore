import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folder/routes/index.dart';

// includes title, icon view all and list book with horizontal scroll bar
class ListBookSession extends StatelessWidget {
  const ListBookSession(
      {Key? key, required this.title, required this.child, this.header})
      : super(key: key);

  final String title;
  final Widget child;
  final Widget? header;

  void _viewAll(BuildContext context) {
    Navigator.of(context).pushNamed(RouteManager.ROUTE_BOOKS_FOR_SALE);
  }

  Widget _title(String title, BuildContext context) {
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
          InkWell(
            onTap: () => _viewAll(context),
            child: Image(
              image: AssetImage("assets/icons/icon-view-all.png"),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _title(title, context),
        if (header != null) ...[
          Container(
            child: header,
          )
        ],
        SizedBox(
            child: Container(
                alignment: Alignment.topLeft,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal, child: child))),
      ],
    );
  }
}
