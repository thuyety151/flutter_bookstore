import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';

class ListButtonOptions<T> extends StatefulWidget {
  const ListButtonOptions(
      {Key? key,
      this.listLabel,
      required this.onPress,
      this.selectedIndex,
      required this.width,
      this.canScroll})
      : super(key: key);
  final List<String>? listLabel;
  final Function(int) onPress;
  final int? selectedIndex;
  final double width;
  final bool? canScroll;
  @override
  _ListButtonOptionsState createState() => _ListButtonOptionsState();
}

class _ListButtonOptionsState extends State<ListButtonOptions> {
  late int selectedIndex = widget.selectedIndex ?? -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        key: widget.key,
        height: 42,
        width: MediaQuery.of(context).size.width - 2 * 21,
        child: widget.canScroll != null && widget.canScroll == true
            ? ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: widget.listLabel!.length,
                itemBuilder: (BuildContext context, int index) => Card(
                  child: OutlinedButton(
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
                  ),
                ),
              )
            : Wrap(
                direction: Axis.horizontal,
                spacing: 8,
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
                        ))));
  }
}
