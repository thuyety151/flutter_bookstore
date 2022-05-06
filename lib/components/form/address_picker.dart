import 'package:flutter/material.dart';
import 'package:flutter_folder/components/form/outlined_select.dart';
import 'package:flutter_folder/models/ghn/district.dart';
import 'package:flutter_folder/models/ghn/province.dart';
import 'package:flutter_folder/models/ghn/ward.dart';
import 'package:flutter_folder/provider/ghn_model.dart';
import 'package:provider/provider.dart';

class AddressFormValue {
  Province? province;
  District? district;
  Ward? ward;

  AddressFormValue({this.province, this.district, this.ward});
}

class AddressPicker extends StatefulWidget {
  const AddressPicker({Key? key, required this.emitValue}) : super(key: key);
  final Function(AddressFormValue) emitValue;

  @override
  _AddressPickerState createState() => _AddressPickerState();
}

class _AddressPickerState extends State<AddressPicker> {
  late AddressFormValue formValue = AddressFormValue();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<GHNModel>(context, listen: false).getListProvince();
  }

  void getNewProvince(dynamic value) {
    setState(() {
      // formValue.provinceId = value;
      formValue.province = value as Province;
    });

    Provider.of<GHNModel>(context, listen: false)
        .getListDistrict(formValue.province?.provinceId.toString() ?? "");
    formValue.district = null;
    formValue.ward = null;
  }

  void getNewDistrict(dynamic value) {
    setState(() {
      formValue.district = value;
    });
    Provider.of<GHNModel>(context, listen: false)
        .getListWard(formValue.district?.districtID.toString() ?? "");
    formValue.ward = null;
  }

  void getNewWard(dynamic value) {
    setState(() {
      formValue.ward = value;
    });
    widget.emitValue(formValue);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GHNModel>(
        builder: (context, value, child) => Column(children: [
              OutlinedSelect<Province>(
                label: "Province",
                hint: "Choose province",
                modelValue: formValue.province,
                onChange: (value) {
                  getNewProvince(value);
                },
                options: value.listProvince
                    .map((e) =>
                        SelectOption<Province>(label: e.provinceName, value: e))
                    .toList(),
              ),
              OutlinedSelect<District>(
                label: "District",
                hint: "Choose district",
                options: value.listDistrict
                    .map((e) => SelectOption(label: e.districtName, value: e))
                    .toList(),
                modelValue: formValue.district,
                onChange: (value) {
                  getNewDistrict(value);
                },
              ),
              OutlinedSelect<Ward>(
                label: "Ward",
                hint: "Choose ward",
                options: value.listWard
                    .map((e) => SelectOption(label: e.wardName, value: e))
                    .toList(),
                modelValue: formValue.ward,
                onChange: (value) {
                  getNewWard(value);
                },
              ),
            ]));
  }
}
