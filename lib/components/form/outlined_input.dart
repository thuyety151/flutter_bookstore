import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/configs/constants.dart';
import 'package:flutter_folder/helpers/validation.dart';

class OutlinedInput extends StatefulWidget {
  const OutlinedInput(
      {Key? key,
      this.label,
      this.prefixIcon,
      this.placeholder,
      this.obscureText,
      this.enabled,
      this.maxLines,
      this.ruleNames,
      this.modelValue,
      required this.onUpdateValue,
      this.padding})
      : super(key: key);

  final String? label;
  final Icon? prefixIcon;
  final String? placeholder;
  final bool? obscureText;
  final bool? enabled;
  final int? maxLines;
  final List<ValidationName>? ruleNames;
  final String? modelValue;
  final ValueChanged<String> onUpdateValue;
  final EdgeInsets? padding;

  @override
  _OutlinedInputState createState() => _OutlinedInputState();
}

class _OutlinedInputState extends State<OutlinedInput> {
  late String? value;
  final Validation validator = Validation(value: "");
  late List<String?> errors = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      value = widget.modelValue;
    });
  }

  void _getValidator() {
    if (widget.ruleNames == null) {
      return;
    }
    dynamic listError = widget.ruleNames!
        .map((e) => validator.getValidatorByName(e, value))
        .toList();

    listError.removeWhere((element) => element == null);

    setState(() {
      errors = listError;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        key: widget.key,
        padding: widget.padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label != null) ...[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  widget.label?.toUpperCase() ?? "",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: AppColors.kTextGrey),
                ),
              )
            ],
            TextFormField(
              initialValue: value,
              maxLines: widget.maxLines ?? 1,
              onChanged: (input) {
                widget.onUpdateValue(input);
                setState(() {
                  value = input;
                });
              },
              obscureText: widget.obscureText ?? false,
              enabled: widget.enabled ?? true,
              decoration: InputDecoration(
                  hintText: widget.placeholder ?? "",
                  border: InputBorder.none,
                  prefixIcon: widget.prefixIcon,
                  enabledBorder: outlineInputBorder(),
                  disabledBorder: outlineInputBorder(),
                  focusedBorder: outlineInputBorder(),
                  focusedErrorBorder: errorInputBorder(),
                  errorBorder: errorInputBorder(),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
              validator: (value) {
                _getValidator();
                return errors.isNotEmpty ? errors.first : null;
              },
            ),
          ],
        ));
  }
}
