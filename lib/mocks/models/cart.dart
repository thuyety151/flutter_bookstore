import 'book.dart';

class Cart {
  final Book book;
  final int quantity;

  Cart({required this.book, required this.quantity});

}

List<Cart> carts = [
    Cart(
      book: books[0], quantity: 2,
    ),
    Cart(
      book: books[1], quantity: 3,
    ),
    Cart(
      book: books[2], quantity: 1,
    ),
     Cart(
      book: books[3], quantity: 5,
    ),
  ];