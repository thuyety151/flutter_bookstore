import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/configs/constants.dart';
import 'package:flutter_folder/models/book.dart';
import 'package:flutter_folder/models/item.dart';
import 'package:flutter_folder/provider/wishlist_provider.dart';
import 'package:flutter_folder/routes/index.dart';
import 'package:flutter_folder/screens/book_detail/book_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import '../../provider/cart.dart';

class BookCard extends StatelessWidget {
  const BookCard({Key? key, required this.book}) : super(key: key);
  final Book book;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);

    void addToWishList() {
      Provider.of<WishlistProvider>(context, listen: false).addToWishlist(
          Item.params(
              attributeId: book.attributeId,
              productId: book.id,
              quantity: 1), () {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Add item to wish list successfully!"),
          duration: Duration(seconds: 1),
        ));
      }, () {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Add item to wish list failed!"),
          duration: Duration(seconds: 1),
        ));
      });
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    }

    return GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(
            RouteManager.ROUTE_PRODUCT_DETAIL,
            arguments: BookDetailArgs(id: book.id)),
        child: Container(
          color: Colors.white,
          width: 170,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(
                image: NetworkImage(book.pictureUrl ?? ""),
                height: 194,
                width: 146,
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 18,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.attributeName!.toUpperCase(),
                    style: AppTextStyles.attribute,
                  ),
                  IconButton(
                      padding: const EdgeInsets.all(0),
                      alignment: Alignment.topRight,
                      color: AppColors.kPrimary,
                      onPressed: addToWishList,
                      icon: const Icon(
                        Icons.favorite_outline,
                        size: 18,
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            // ignore: sized_box_for_whitespace
            Container(
              height: 32,
              child: ReadMoreText(
                book.name,
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimCollapsedText: " ",
                style: AppTextStyles.title,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              book.authorName ?? "--",
              style: AppTextStyles.caption,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "\$${book.price}",
                      style: AppTextStyles.price,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      "\$201",
                      style: TextStyle(
                          color: AppColors.kTextGrey,
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    cart.addOrUpdateItem(book.id, book.attributeId!, 1);
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Add item to cart successfully!"),
                      duration: Duration(seconds: 1),
                    ));
                  },
                  icon: const Image(
                      image: AssetImage("assets/icons/icon-cart-primary.png")),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
          ]),
        ));
  }
}
