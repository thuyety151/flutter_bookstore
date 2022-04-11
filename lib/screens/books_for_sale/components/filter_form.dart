import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folder/components/form/list_button_options.dart';
import 'package:flutter_folder/components/form/multiple_select.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/screens/books_for_sale/components/options_review.dart';

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
          children: [
            Text(
              "Pricing",
              style: const TextStyle(
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
            child: Container(
              width: MediaQuery.of(context).size.width - 42,
              child: RangeSlider(
                activeColor: AppColors.kPrimary,
                inactiveColor: AppColors.kGrayE5,
                max: 100,
                divisions: 5,
                labels: RangeLabels(
                  "50",
                  "100",
                ),
                values: RangeValues(50, 100),
                onChanged: (double) {
                  print(double);
                },
              ),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 21),
      child: Wrap(direction: Axis.vertical, spacing: 8, children: [
        _title("Category"),
        const ListButtonOptions(),
        _pricing(context),
        _title("Authors"),
        // TODO: change props of MultipleSelect
        MultipleSelect(),
        _title("Format"),
        MultipleSelect(),
        _title("Review"),
        OptionsReview()
      ]),
    );
  }
}
