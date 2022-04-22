import 'package:flutter/cupertino.dart';
import 'package:flutter_folder/components/book/deal_of_week.dart';
import 'package:flutter_folder/components/list_book_section.dart';
import 'package:flutter_folder/provider/book_model.dart';
import 'package:provider/provider.dart';

class DealOfWeek extends StatelessWidget {
  const DealOfWeek({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<BookModel>(context, listen: false)
        .getListBookForSale("deal-of-week");

    return ListBookSession(
      title: "Deals of week",
      child: Consumer<BookModel>(
          builder: (context, value, child) => Wrap(
              spacing: 12,
              children: List.generate(
                  value.listDeal.length,
                  (index) => DealOfWeekCard(
                        model: value.listDeal[index],
                      )))),
    );
  }
}
