import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/mocks/models/category.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

class MultipleSelect<T> extends StatefulWidget {
  const MultipleSelect(
      {Key? key, this.listItem, required this.title, required this.placeholder})
      : super(key: key);

  final String title;
  final String placeholder;
  final List<MultiSelectItem>? listItem;

  @override
  _MultipleSelectState createState() => _MultipleSelectState();
}

class _MultipleSelectState extends State<MultipleSelect> {
  final List<Category> _selectedAnimals2 = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
              // _selectedAnimals2 = values;
            },
            chipDisplay: MultiSelectChipDisplay(
              chipColor: AppColors.kDarkGrey,
              textStyle: const TextStyle(color: Colors.black),
              onTap: (value) {
                setState(() {
                  _selectedAnimals2.remove(value);
                });
              },
            ),
          ),
          // TODO: double check these code and remove if unuse it
          // _selectedAnimals2 == null || _selectedAnimals2.isEmpty
          //     ? Container(
          //         padding: EdgeInsets.all(10),
          //         alignment: Alignment.centerLeft,
          //         child: Text(
          //           "None selected",
          //           style: TextStyle(color: Colors.black54),
          //         ))
          //     : Container(),
        ),
      ],
    );
  }
}
