import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';

class SelectOption<T> {
  String? label;
  T value;
  SelectOption({this.label, required this.value});
}

class OutlinedSelect<T> extends StatefulWidget {
  const OutlinedSelect({
    Key? key,
    this.label,
    this.items,
    required this.modelValue,
    required this.onChange,
    required this.options,
    required this.hint,
  }) : super(key: key);

  final String? label;
  final List<DropdownMenuItem<T>>? items;
  final T? modelValue;
  final String hint;
  final Function(dynamic) onChange;
  final List<SelectOption<T>> options;

  @override
  _OutlinedSelectState createState() => _OutlinedSelectState();
}

class _OutlinedSelectState<T> extends State<OutlinedSelect<T>> {
  @override
  Widget build(BuildContext context) {

    return Column(
        key: widget.key,
        // key: Key(widget.options.length.toString()),
        mainAxisSize: MainAxisSize.min,
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
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: DropdownButton(
                value: widget.modelValue,
                // value: widget.options
                //     .where((element) => element.value == widget.modelValue)
                //     .first,
                hint: Text(widget.hint),
                items: widget.options.isEmpty
                    ? []
                    : widget.options
                        .map((e) => DropdownMenuItem<T>(
                            value: e.value, child: Text(e.label ?? "")))
                        .toList(),
                onChanged: (dynamic newValue) {
                  if (newValue != widget.modelValue) {
                    widget.onChange(newValue);
                  }
                },
                isExpanded: true,
                underline: const SizedBox(),
              ),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                      color: const Color.fromARGB(100, 158, 158, 158))),
            )
          ]
        ]);
  }
}
