import 'package:flutter/material.dart';
import 'package:flutter_folder/components/button/primary_button.dart';
import 'package:flutter_folder/components/form/address_picker.dart';
import 'package:flutter_folder/components/form/outlined_input.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/helpers/validation.dart';
import 'package:flutter_folder/models/address.dart';
import 'package:flutter_folder/provider/address_model.dart';
import 'package:provider/provider.dart';

class AddressForm extends StatefulWidget {
  const AddressForm({Key? key, required this.submit, this.modelValue})
      : super(key: key);
  final Function(Address) submit;
  final Address? modelValue;

  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  late Address formValue = Address();
  final _formKey = GlobalKey<FormState>();
  late bool isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.modelValue?.id != null) {
      setState(() {
        formValue = widget.modelValue as Address;
      });
    }
  }

  void onSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        isLoading = true;
      });
      Provider.of<AddressModel>(context, listen: false)
          .createAddress(formValue);
      // widget.submit(formValue);

      setState(() {
        isLoading = false;
      });
    }
  }

  void getAddressPickerData(AddressFormValue value) {
    setState(() {
      formValue.districtID = value.district?.districtID;
      formValue.districtName = value.district?.districtName;
      formValue.provinceID = value.province?.provinceId;
      formValue.provinceName = value.province?.provinceName;
      formValue.wardName = value.ward?.wardName;
      formValue.wardCode = value.ward?.wardCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              OutlinedInput(
                placeholder: "Enter your first name",
                onUpdateValue: (String value) {
                  setState(() {
                    formValue.firstName = value;
                  });
                },
                modelValue: formValue.firstName,
                ruleNames: const [ValidationName.required],
                label: "First name",
              ),
              OutlinedInput(
                placeholder: "Enter your last name",
                onUpdateValue: (String value) {
                  setState(() {
                    formValue.lastName = value;
                  });
                },
                modelValue: formValue.lastName,
                ruleNames: const [ValidationName.required],
                label: "Last name",
              ),
              OutlinedInput(
                placeholder: "Enter your phone number",
                onUpdateValue: (String value) {
                  setState(() {
                    formValue.phone = value;
                  });
                },
                modelValue: formValue.phone,
                ruleNames: const [ValidationName.required],
                label: "Phone number",
              ),
              AddressPicker(
                modelValue: formValue,
                emitValue: getAddressPickerData,
              ),
              OutlinedInput(
                placeholder: "Enter your street",
                onUpdateValue: (String value) {
                  setState(() {
                    formValue.streetAddress = value;
                  });
                },
                modelValue: formValue.streetAddress,
                ruleNames: const [ValidationName.required],
                label: "Street",
              ),
              OutlinedInput(
                placeholder: "Enter your apartment number",
                onUpdateValue: (String value) {
                  setState(() {
                    formValue.apartmentNumber = value;
                  });
                },
                modelValue: formValue.apartmentNumber,
                ruleNames: const [ValidationName.required],
                label: "Apartment number",
              ),
              Row(children: [
                Checkbox(
                    activeColor: AppColors.kPrimary,
                    value: formValue.isMain,
                    onChanged: (bool? value) {
                      if (value != null) {
                        setState(() {
                          formValue.isMain = value;
                        });
                      }
                    }),
                const Text("Default")
              ]),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: PrimaryButton(
                  onTap: onSubmit,
                  buttonText: formValue.id == null ? "Create" : "Update",
                  buttonColor: AppColors.kPrimary,
                  fullWidth: true,
                  textColor: Colors.white,
                ),
              )
            ])));
  }
}
