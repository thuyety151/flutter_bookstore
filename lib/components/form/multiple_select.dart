import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/mocks/models/Author.dart';
import 'package:flutter_folder/mocks/models/Category.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

class MultipleSelect extends StatefulWidget {
  const MultipleSelect({Key? key}) : super(key: key);

  @override
  _MultipleSelectState createState() => _MultipleSelectState();
}

class _MultipleSelectState extends State<MultipleSelect> {
  List<Category> _selectedAnimals2 = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final _items = listCategory
      .map((animal) => MultiSelectItem<Category>(animal, animal.name))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width - 2 * 21,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColors.kGrayE5,
                  width: 2,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: MultiSelectBottomSheetField(
              // TODO: dense chips, change color of active checkbox to primary
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 0),
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              initialChildSize: 0.4,
              listType: MultiSelectListType.LIST,
              searchable: true,
              buttonText: Text("Choose author"),
              title: Text("Animals"),
              items: _items,
              buttonIcon: Icon(Icons.search),
              onConfirm: (values) {
                // _selectedAnimals2 = values;
              },
              chipDisplay: MultiSelectChipDisplay(
                chipColor: AppColors.kDarkGrey,
                textStyle: TextStyle(color: Colors.black),
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
      ),
    );
  }
}
