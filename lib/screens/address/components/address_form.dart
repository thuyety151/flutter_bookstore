import 'package:flutter/material.dart';
import 'package:flutter_folder/components/button/primary_button.dart';
import 'package:flutter_folder/components/form/address_picker.dart';
import 'package:flutter_folder/components/form/outlined_input.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/helpers/validation.dart';
import 'package:flutter_folder/models/address.dart';

class AddressForm extends StatefulWidget {
  const AddressForm({Key? key, required this.submit}) : super(key: key);
  final Function(Address) submit;

  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  late Address formValue = Address();
  final _formKey = GlobalKey<FormState>();
  late bool isLoading = false;

  void onSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        isLoading = true;
      });
      widget.submit(formValue);

      setState(() {
        isLoading = false;
      });
    }
  }

  void getAddressPickerData(AddressFormValue value) {
    setState(() {
      formValue.districtID = value.district?.districtID.toString();
      formValue.districtName = value.district?.districtName;
      formValue.provinceID = value.province?.provinceId.toString();
      formValue.provinceName = value.province?.provinceName;
      formValue.wardName = value.ward?.wardName;
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
                ruleNames: const [ValidationName.required],
                label: "Phone number",
              ),
              AddressPicker(
                emitValue: getAddressPickerData,
              ),
              OutlinedInput(
                placeholder: "Enter your street",
                onUpdateValue: (String value) {
                  setState(() {
                    formValue.streetAddress = value;
                  });
                },
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
                  buttonText: "Create",
                  buttonColor: AppColors.kPrimary,
                  fullWidth: true,
                  textColor: Colors.white,
                ),
              )
            ])));
  }
}
