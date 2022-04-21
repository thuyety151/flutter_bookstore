import 'package:flutter/cupertino.dart';
import 'package:flutter_folder/components/list_book_section.dart';
import 'package:flutter_folder/provider/author_model.dart';
import 'package:provider/provider.dart';

class Authors extends StatelessWidget {
  const Authors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<AuthorModel>(context).getListAuthor();

    return ListBookSession(
      title: "Authors",
      child: Consumer<AuthorModel>(
          builder: (context, value, child) => Wrap(
                spacing: 12,
                children: List.generate(
                    value.listAuthor.length,
                    (index) => Container(
                          height: 100,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Column(children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              child: Image(
                                image: NetworkImage(
                                    value.listAuthor[index].imageUrl),
                                height: 50,
                                width: 50,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              value.listAuthor[index].name,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            )
                          ]),
                        )),
              )),
    );
  }
}
