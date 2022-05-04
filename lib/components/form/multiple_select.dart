// ignore_for_file: unnecessary_null_comparison, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

class MultipleSelect<T> extends StatefulWidget {
  const MultipleSelect(
      {Key? key,
      this.listItem,
      required this.title,
      required this.placeholder,
      required this.onConfirm})
      : super(key: key);

  final String title;
  final String placeholder;
  final List<MultiSelectItem>? listItem;
  final Function(List<dynamic>) onConfirm;

  @override
  _MultipleSelectState createState() => _MultipleSelectState();
}

class _MultipleSelectState extends State<MultipleSelect> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: widget.key,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width - 2 * 21,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: AppColors.kGrayE5,
                width: 2,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: MultiSelectBottomSheetField(
            // TODO: dense chips, change color of active checkbox to primary
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 0),
                borderRadius: const BorderRadius.all(Radius.circular(16))),
            initialChildSize: 0.4,
            listType: MultiSelectListType.LIST,
            searchable: true,
            buttonText: Text(widget.placeholder),
            title: Text(widget.title),
            items: widget.listItem!.toList(),
            selectedColor: AppColors.kPrimary,
            buttonIcon: const Icon(Icons.search),
            onConfirm: (values) {
              if (values == null) {
                return;
              }
              widget.onConfirm(values.toList());
            },
            chipDisplay: MultiSelectChipDisplay(
              chipColor: AppColors.kDarkGrey,
              textStyle: const TextStyle(color: Colors.black),
              onTap: (value) {
                print(value);
                // setState(() {
                //   _selectedAnimals2.remove(value);
                // });
              },
            ),
          ),
        ),
      ],
    );
  }
}
