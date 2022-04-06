import 'package:flutter/cupertino.dart';
import 'package:flutter_folder/components/form/outlined_input.dart';
import 'package:flutter_folder/components/form/outlined_select.dart';

class AddressPicker extends StatefulWidget {
  const AddressPicker({Key? key}) : super(key: key);

  @override
  _AddressPickerState createState() => _AddressPickerState();
}

class _AddressPickerState extends State<AddressPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        OutlinedSelect(label: "City"),
        OutlinedSelect(label: "District"),
        OutlinedSelect(label: "Commune/Ward"),
        OutlinedInput(label: "Street")
      ]),
    );
  }
}
