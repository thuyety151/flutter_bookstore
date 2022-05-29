import 'package:flutter/material.dart';
import 'package:flutter_folder/models/item.dart';
import 'package:flutter_folder/screens/manage_order/components/manage_order_item.dart';

class ManageOrderListItem extends StatefulWidget {
  const ManageOrderListItem({Key? key, required this.items}) : super(key: key);
  final List<Item> items;

  @override
  State<ManageOrderListItem> createState() => _ManageOrderListItemState();
}

class _ManageOrderListItemState extends State<ManageOrderListItem> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Dismissible(
          key: Key(widget.items[index].productId.toString()),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            setState(() {
              widget.items.removeAt(index);
            });
          },
          background: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFFFE6E6),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.restore_from_trash),
                ),
              ],
            ),
          ),
          child: ManageOrderItem(checkoutItem: widget.items[index]),
        ),
      ),
      itemCount: widget.items.length,
    );
  }
}
