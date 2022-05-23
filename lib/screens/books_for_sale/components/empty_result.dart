import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/button/primary_button.dart';
import '../../../provider/book_model.dart';
import '../../../routes/index.dart';

class EmptyResult extends StatelessWidget {
  const EmptyResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        children: [
          Container(
            height: 300,
            child: Image.asset(
              "assets/images/empty_result.png",
            ),
          ),
           const Spacer(),
          SizedBox(
            child: PrimaryButton(
              onTap: () {
                Provider.of<BookModel>(context, listen: false).clearFilterData();
                Navigator.of(context).pushNamed(RouteManager.ROUTE_BOOKS_FOR_SALE);
              },
              buttonText: "Back",
              buttonColor:const Color.fromARGB(255, 249, 82, 69),
              textColor: Colors.white,
              buttonWidth: 200,
              loading: false,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
