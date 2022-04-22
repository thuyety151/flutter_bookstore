import 'book.dart';

class CartItemModel {
  final Book book;
  final int quantity;

  CartItemModel({required this.book, required this.quantity});

}

List<CartItemModel> cartItems = [
    CartItemModel(
      book: books[0], quantity: 2,
    ),
    CartItemModel(
      book: books[1], quantity: 3,
    ),
    CartItemModel(
      book: books[2], quantity: 1,
    ),
     CartItemModel(
      book: books[3], quantity: 5,
    ),
  ];