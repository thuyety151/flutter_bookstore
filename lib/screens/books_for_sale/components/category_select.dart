import 'package:flutter/material.dart';
import 'package:flutter_folder/provider/category_model.dart';
import 'package:provider/provider.dart';

class CategorySelect extends StatefulWidget {
  const CategorySelect({Key? key, this.modelValue, required this.onChange})
      : super(key: key);
  final String? modelValue;
  final Function(String?) onChange;
  @override
  _CategorySelectState createState() => _CategorySelectState();
}

class _CategorySelectState extends State<CategorySelect> {
  late String? currentValue = widget.modelValue;

  @override
  Widget build(BuildContext context) {
    Provider.of<CategoryModel>(context, listen: false).getAll();
    return Container(
      key: widget.key,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      child: Consumer<CategoryModel>(
          builder: (context, value, child) => DropdownButton<String>(
                value: currentValue,
                items: value.options
                    .map((e) => DropdownMenuItem(
                          child: Text(e.name),
                          value: e.id,
                        ))
                    .toList(),
                onChanged: (String? newValue) {
                  widget.onChange(newValue);
                  setState(() {
                    currentValue = newValue;
                  });
                },
                isExpanded: true,
                underline: const SizedBox(),
                hint: const Text("Choose category"),
              )),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: const Color.fromARGB(100, 158, 158, 158))),
    );
  }
}
