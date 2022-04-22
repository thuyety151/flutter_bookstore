import 'package:flutter/cupertino.dart';
import 'package:flutter_folder/components/book/book_card.dart';
import 'package:flutter_folder/components/list_book_section.dart';
import 'package:flutter_folder/provider/book_model.dart';
import 'package:provider/provider.dart';

class BestSelling extends StatelessWidget {
  const BestSelling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<BookModel>(context, listen: false).getListBestSelling();

    return ListBookSession(
      title: "Best selling",
      child: Consumer<BookModel>(
          builder: ((context, value, child) => Wrap(
                spacing: 12,
                children: List.generate(value.listBestSelling.length,
                    (index) => BookCard(book: value.listBestSelling[index])),
              ))),
    );
  }
}
