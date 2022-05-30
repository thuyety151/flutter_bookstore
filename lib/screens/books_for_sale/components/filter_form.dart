// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_folder/components/form/list_button_options.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/configs/constants.dart';
import 'package:flutter_folder/models/filter.dart';
import 'package:flutter_folder/provider/attribute_model.dart';
import 'package:flutter_folder/provider/book_model.dart';
import 'package:flutter_folder/screens/books_for_sale/components/author_select.dart';
import 'package:flutter_folder/screens/books_for_sale/components/category_select.dart';
import 'package:flutter_folder/screens/books_for_sale/components/options_review.dart';
import 'package:provider/provider.dart';

class FilterForm extends StatefulWidget {
  const FilterForm({Key? key}) : super(key: key);

  @override
  _FilterFormState createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  late Filter formValue;

  void saveData(BuildContext context) {
    Provider.of<BookModel>(context, listen: false).setFilterData(formValue);
    Navigator.pop(context);
  }

  Widget _title(String title) {
    return Text(
      title,
      style: const TextStyle(
          fontWeight: FontWeight.w600, fontSize: 14, letterSpacing: 2),
    );
  }

  Widget _filterHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FlatButton(
            onPressed: () {
              setState(() {
                formValue = Filter.empty();
              });

              Provider.of<BookModel>(context, listen: false).clearFilterData();
            },
            child: const Text(
              "Clear",
              style: TextStyle(fontSize: 12),
            )),
        const Text(
          "Filters",
          style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 2),
        ),
        FlatButton(
            onPressed: () => saveData(context),
            child: const Text(
              "Save",
              style: TextStyle(fontSize: 12),
            )),
      ],
    );
  }

  Widget _pricing(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 2 * 21,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Pricing",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    letterSpacing: 2),
              ),
              Text(
                formValue.maxPrice == 0 || formValue.minPrice == 100
                    ? "All"
                    : "\$${formValue.minPrice.toString()} - \$${formValue.maxPrice.toString()}",
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        SliderTheme(
            data: SliderThemeData(
                overlayShape: SliderComponentShape.noOverlay,
                trackHeight: 3,
                thumbShape: SliderComponentShape.noThumb,
                trackShape: const RoundedRectSliderTrackShape()),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 42,
              child: RangeSlider(
                activeColor: AppColors.kPrimary,
                inactiveColor: AppColors.kGrayE5,
                min: 0,
                max: 100,
                divisions: 100,
                labels: RangeLabels(
                  formValue.minPrice.toString(),
                  formValue.maxPrice.toString(),
                ),
                values: RangeValues(formValue.minPrice, formValue.maxPrice),
                onChanged: (RangeValues value) {
                  setState(() {
                    formValue.minPrice = value.start;
                    formValue.maxPrice = value.end;
                  });
                },
              ),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    formValue = Provider.of<BookModel>(context, listen: false).filterData;
    Provider.of<AttributeModel>(context, listen: false).getListAttribute();
    return Container(
        decoration: showBottomSheetStyle(),
        child: Column(
          children: [
            Column(children: [
              _filterHeader(),
              const Divider(
                thickness: 1,
                color: Color.fromARGB(100, 158, 158, 158),
              ),
            ]),
            Expanded(
                child: SingleChildScrollView(
              child: Wrap(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 21),
                    child:
                        Wrap(direction: Axis.vertical, spacing: 8, children: [
                      _title("Attributes"),
                      Consumer<AttributeModel>(
                        builder: (context, value, child) => ListButtonOptions(
                          width: MediaQuery.of(context).size.width - 2 * 21,
                          key: Key(formValue.attributeId ?? ""),
                          listLabel:
                              value.attributes.map((e) => e.name).toList(),
                          selectedIndex: value.attributes.indexWhere(
                              (element) => element.id == formValue.attributeId),
                          onPress: (index) {
                            setState(() {
                              formValue.attributeId =
                                  value.attributes[index].id;
                            });
                          },
                        ),
                      ),
                      _pricing(context),
                      _title("Authors"),
                      // TODO: change props of MultipleSelect
                      // Consumer<AuthorModel>(
                      //   builder: (context, value, child) => MultipleSelect(
                      //       key: const Key("select-author"),
                      //       title: "Author",
                      //       placeholder: "Choose author",
                      //       onConfirm: (values) {
                      //         setState(() {
                      //           formValue.authorId = values.first.id;
                      //         });
                      //       },
                      //       listItem: value.listAuthor
                      //           .map((author) => MultiSelectItem<Author>(
                      //               author, author.name))
                      //           .toList()),
                      // ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 2 * 21,
                        child: AuthorSelect(
                          key: Key(formValue.authorId ?? ""),
                          modelValue: formValue.authorId,
                          onChange: (value) => setState(() {
                            formValue.authorId = value;
                          }),
                        ),
                      ),
                      _title("Category"),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 2 * 21,
                        child: CategorySelect(
                          key: Key(formValue.categoryId ?? ""),
                          modelValue: formValue.categoryId,
                          onChange: (value) => setState(() {
                            formValue.categoryId = value;
                          }),
                        ),
                      ),
                      // Consumer<CategoryModel>(
                      //   builder: (context, value, child) =>
                      //       MultipleSelect<Category>(
                      //           key: const Key("select-category"),
                      //           title: "Category",
                      //           placeholder: "Choose categories",
                      //           onConfirm: (values) {
                      //             setState(() {
                      //               formValue.categoryId = values.first.id;
                      //             });
                      //           },
                      //           listItem: value.categoryHomescreen
                      //               .map((cate) => MultiSelectItem<Category>(
                      //                   cate, cate.name))
                      //               .toList()),
                      // ),
                      _title("Review"),
                      OptionsReview(
                        key: Key(formValue.rate.toString()),
                        value: formValue.rate,
                        getRate: (rate) {
                          setState(() {
                            formValue.rate = rate;
                          });
                        },
                      )
                    ]),
                  )
                ],
              ),
            ))
          ],
        ));
  }
}
