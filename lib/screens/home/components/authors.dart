import 'package:flutter/cupertino.dart';
import 'package:flutter_folder/components/list_book_section.dart';
import 'package:flutter_folder/provider/author_model.dart';
import 'package:flutter_folder/routes/index.dart';
import 'package:flutter_folder/screens/books_for_sale/books_for_sale_screen.dart';
import 'package:provider/provider.dart';

class Authors extends StatelessWidget {
  const Authors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<AuthorModel>(context, listen: false).getListAuthor();

    return ListBookSession(
      title: "Authors",
      hideViewAll: true,
      child: Consumer<AuthorModel>(
          builder: (context, value, child) => Wrap(
                spacing: 12,
                children: List.generate(
                    value.authors.length,
                    (index) => GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                RouteManager.ROUTE_BOOKS_FOR_SALE,
                                arguments: BFSArguments(
                                    authorId: value.authors[index].id));
                          },
                          child: Container(
                            height: 100,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(children: [
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
                                child: Image(
                                  image: NetworkImage(
                                      value.authors[index].imageUrl),
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                value.authors[index].name,
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              )
                            ]),
                          ),
                        )),
              )),
    );
  }
}
