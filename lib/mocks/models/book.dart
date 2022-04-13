import 'package:flutter/foundation.dart';

class Book {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imgUrl;
  final double rate;

  Book(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.imgUrl,
      required this.rate
      });
}

List<Book> books = [
    Book(
        id: '1',
        name: 'Harry Potter 4',
        description: 'Planet Earth is 4.5 billion years old',
        price: 10.09,
        rate: 4,
        imgUrl:
            'https://res.cloudinary.com/dnjhqv3qw/image/upload/v1637991420/soflh6ojpomhqytdqxlv.jpg'),
    Book(
        id: '2',
        name: 'The Alchemist',
        description: 'Lorem ipsum dolor sit amet',
        price: 8.09,
        rate: 5,
        imgUrl:
            'https://res.cloudinary.com/dnjhqv3qw/image/upload/v1641650459/fuzrcpsdvixrzncneo8m.jpg'),
    Book(
        id: '3',
        name: 'Me Before You',
        description: 'No matter your goals, Atomic Habits offers ',
        price: 10.09,
        rate: 5,
        imgUrl:
            'https://res.cloudinary.com/dnjhqv3qw/image/upload/v1638001547/tyidcqekzkiwbel8rrp8.jpg'),
    Book(
        id: '4',
        name: 'Call Me By Your Name',
        description: 'System 1 is fast, intuitive, and emotional',
        price: 10.09,
        rate: 3,
        imgUrl:
            'https://res.cloudinary.com/dnjhqv3qw/image/upload/v1638353955/aamldzpcbbcm1ipm61xg.jpg'),
  ];
