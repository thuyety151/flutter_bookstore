import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';

class OutlinedInput extends StatefulWidget {
  const OutlinedInput(
      {Key? key,
      this.label,
      this.prefixIcon,
      this.placeholder,
      this.obscureText,
      this.enabled,
      this.maxLines})
      : super(key: key);

  final String? label;
  final Icon? prefixIcon;
  final String? placeholder;
  final bool? obscureText;
  final bool? enabled;
  final int? maxLines;

  @override
  _OutlinedInputState createState() => _OutlinedInputState();
}

class _OutlinedInputState extends State<OutlinedInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
        key: widget.key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label != null) ...[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  widget.label?.toUpperCase() ?? "",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: AppColors.kTextGrey),
                ),
              )
            ],
            TextField(
              maxLines: widget.maxLines ?? 1,
              // onChanged: (input)=>loginRequestModel.password=input,
              obscureText: widget.obscureText ?? false,
              enabled: widget.enabled ?? true,
              decoration: InputDecoration(
                  hintText: widget.placeholder ?? "",
                  border: InputBorder.none,
                  prefixIcon: widget.prefixIcon,
                  // Icon(Icons.lock_outline, size: 20, color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(100, 158, 158, 158))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(100, 158, 158, 158))),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
            ),
          ],
        ));
  }
}
