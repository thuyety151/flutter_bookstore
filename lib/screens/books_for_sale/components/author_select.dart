import 'package:flutter/material.dart';
import 'package:flutter_folder/provider/author_model.dart';
import 'package:provider/provider.dart';

class AuthorSelect extends StatefulWidget {
  const AuthorSelect({Key? key, this.modelValue, required this.onChange})
      : super(key: key);
  final String? modelValue;
  final Function(String?) onChange;
  @override
  _AuthorSelectState createState() => _AuthorSelectState();
}

class _AuthorSelectState extends State<AuthorSelect> {
  late String? currentValue = widget.modelValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widget.key,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      child: Consumer<AuthorModel>(
          builder: (context, value, child) => DropdownButton<String>(
                value: currentValue,
                items: value.listAuthor
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
                hint: const Text("Choose author"),
              )),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: const Color.fromARGB(100, 158, 158, 158))),
    );
  }
}
