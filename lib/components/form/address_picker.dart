import 'package:flutter/material.dart';
import 'package:flutter_folder/components/form/outlined_select.dart';
import 'package:flutter_folder/models/address.dart';
import 'package:flutter_folder/models/ghn/district.dart';
import 'package:flutter_folder/models/ghn/province.dart';
import 'package:flutter_folder/models/ghn/ward.dart';
import 'package:flutter_folder/provider/ghn_model.dart';
import 'package:provider/provider.dart';

class AddressFormValue {
  String? id;
  Province? province;
  District? district;
  Ward? ward;

  AddressFormValue({this.province, this.district, this.ward, this.id});
}

class AddressPicker extends StatefulWidget {
  const AddressPicker({Key? key, required this.emitValue, this.modelValue})
      : super(key: key);
  final Function(AddressFormValue) emitValue;
  final Address? modelValue;

  @override
  _AddressPickerState createState() => _AddressPickerState();
}

class _AddressPickerState extends State<AddressPicker> {
  late AddressFormValue formValue = AddressFormValue();

  Future<void> getInit() async {
    final optionsGHNState = Provider.of<GHNModel>(context, listen: false);
    await Provider.of<GHNModel>(context, listen: false)
        .getListDistrict(widget.modelValue!.provinceID.toString());
    await Provider.of<GHNModel>(context, listen: false)
        .getListWard(widget.modelValue!.districtID.toString());
    setState(() {
      formValue = AddressFormValue(
          id: widget.modelValue!.id,
          province: optionsGHNState.listProvince.firstWhere(
              (element) => element.provinceId == widget.modelValue!.provinceID),
          district: optionsGHNState.listDistrict.firstWhere(
              (element) => element.districtID == widget.modelValue!.districtID),
          ward: optionsGHNState.listWard.firstWhere(
              (element) => element.wardName == widget.modelValue!.wardName));
    });
  }

  @override
  void initState() {
    Provider.of<GHNModel>(context, listen: false).getListProvince();

    super.initState();
    if (widget.modelValue?.id != null) {
      getInit();
    }
  }

  void getNewProvince(dynamic value) {
    setState(() {
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
        builder: (context, value, child) =>
            Column(key: Key(formValue.id ?? ""), children: [
              OutlinedSelect<Province>(
                label: "Province",
                hint: "Choose province",
                onChange: (value) {
                  getNewProvince(value);
                },
                modelValue: formValue.province,
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
