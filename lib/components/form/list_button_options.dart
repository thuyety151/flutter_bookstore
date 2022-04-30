import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';

class ListButtonOptions<T> extends StatefulWidget {
  const ListButtonOptions({Key? key, this.listLabel, required this.onPress})
      : super(key: key);
  final List<String>? listLabel;
  final Function(int) onPress;
  @override
  _ListButtonOptionsState createState() => _ListButtonOptionsState();
}

class _ListButtonOptionsState extends State<ListButtonOptions> {
  late int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 4,
      children: List.generate(
          widget.listLabel!.length,
          (index) => OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: BorderSide(
                        width: 1.0,
                        color: index == selectedIndex
                            ? AppColors.kPrimary
                            : Colors.black38),
                    backgroundColor: index == selectedIndex
                        ? AppColors.kPrimary
                        : Colors.white),
                onPressed: () {
                  setState(() {
                    selectedIndex = index;
                    widget.onPress(index);
                  });
                },
                child: Text(
                  widget.listLabel![index],
                  style: TextStyle(
                      color: index == selectedIndex
                          ? Colors.white
                          : AppColors.kTextGrey),
                ),
              )),
    );
  }
}
