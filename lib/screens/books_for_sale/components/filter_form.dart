import 'package:flutter/material.dart';
import 'package:flutter_folder/components/form/list_button_options.dart';
import 'package:flutter_folder/components/form/multiple_select.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/models/attribute.dart';
import 'package:flutter_folder/models/author.dart';
import 'package:flutter_folder/models/category.dart';
import 'package:flutter_folder/provider/attribute_model.dart';
import 'package:flutter_folder/provider/author_model.dart';
import 'package:flutter_folder/provider/category_model.dart';
import 'package:flutter_folder/screens/books_for_sale/components/options_review.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:provider/provider.dart';

class FilterForm extends StatefulWidget {
  const FilterForm({Key? key}) : super(key: key);

  @override
  _FilterFormState createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  Widget _title(String title) {
    return Text(
      title,
      style: const TextStyle(
          fontWeight: FontWeight.w600, fontSize: 14, letterSpacing: 2),
    );
  }

  Widget _pricing(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Pricing",
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 14, letterSpacing: 2),
            ),
            SizedBox(
              width: 250,
            ),
            Text(
              "\$50 - \$100",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            )
          ],
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
                max: 100,
                divisions: 5,
                labels: const RangeLabels(
                  "50",
                  "100",
                ),
                values: const RangeValues(50, 100),
                onChanged: (RangeValues value) {},
              ),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AttributeModel>(context, listen: false).getListAttribute();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 21),
      child: Wrap(direction: Axis.vertical, spacing: 8, children: [
        _title("Attributes"),
        Consumer<AttributeModel>(
          builder: (context, value, child) => ListButtonOptions(
            listLabel: value.attributes.map((e) => e.name).toList(),
            onPress: (index) {},
          ),
        ),
        _pricing(context),
        _title("Authors"),
        // TODO: change props of MultipleSelect
        Consumer<AuthorModel>(
          builder: (context, value, child) => MultipleSelect(
              title: "Author",
              placeholder: "Choose authors",
              listItem: value.listAuthor
                  .map((author) => MultiSelectItem<Author>(author, author.name))
                  .toList()),
        ),
        _title("Category"),
        Consumer<CategoryModel>(
          builder: (context, value, child) => MultipleSelect(
              title: "Category",
              placeholder: "Choose categories",
              listItem: value.categoryHomescreen
                  .map((cate) => MultiSelectItem<Category>(cate, cate.name))
                  .toList()),
        ),
        _title("Review"),
        const OptionsReview()
      ]),
    );
  }
}
