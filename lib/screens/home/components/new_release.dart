import 'package:flutter/material.dart';
import 'package:flutter_folder/components/book/book_card.dart';
import 'package:flutter_folder/components/list_book_section.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/models/newrelease.dart';
import 'package:flutter_folder/provider/book_model.dart';
import 'package:provider/provider.dart';

class NewRelease extends StatelessWidget {
  const NewRelease({Key? key}) : super(key: key);

  Widget _newReCategories(List<NewReleaseModel> model) {
    return Container(
        alignment: Alignment.topLeft,
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 8,
          children: List.generate(
              model.length,
              (index) => OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            width: 1.0,
                            color: index == 0
                                ? AppColors.kPrimary
                                : Colors.black38),
                        backgroundColor:
                            index == 0 ? AppColors.kPrimary : Colors.white),
                    onPressed: () {},
                    child: Text(
                      model[index].categoryName,
                      style: TextStyle(
                          color:
                              index == 0 ? Colors.white : AppColors.kTextGrey),
                    ),
                  )),
        ));
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<BookModel>(context, listen: false).getListNewRelease();

    return Consumer<BookModel>(
        builder: (context, value, child) => ListBookSession(
              title: "New release",
              header: Column(children: [
                _newReCategories(value.listNewRelease),
                const SizedBox(
                  height: 12,
                ),
              ]),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                    spacing: 12,
                    children: value.listNewRelease.isNotEmpty
                        ? List.generate(
                            value.listNewRelease[0].books.length,
                            (index) => BookCard(
                                book: value.listNewRelease[0].books[index]))
                        : []),
              ),
            ));
  }
}
