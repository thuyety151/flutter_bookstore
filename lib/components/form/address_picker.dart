import 'package:flutter/material.dart';
import 'package:flutter_folder/components/form/outlined_input.dart';
import 'package:flutter_folder/components/form/outlined_select.dart';
import 'package:flutter_folder/models/district.dart';
import 'package:flutter_folder/services/address/district_api.dart';

class AddressPicker extends StatefulWidget {
  const AddressPicker({Key? key}) : super(key: key);

  @override
  _AddressPickerState createState() => _AddressPickerState();
}

class _AddressPickerState extends State<AddressPicker> {
  late List<District> districts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DistrictApi districtApi = DistrictApi();
    districtApi.getDistricts().then((value) {
      print(value);
      if (value != null) {
        districts = value.data ?? [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        OutlinedSelect(label: "City"),
        OutlinedSelect(
          label: "District",
          items: districts
              .map((e) => DropdownMenuItem(
                    child: Text(e.districtName),
                    value: e.districtID.toString(),
                  ))
              .toList(),
        ),
        OutlinedSelect(label: "Commune/Ward"),
        OutlinedInput(label: "Street")
      ]),
    );
  }
}
