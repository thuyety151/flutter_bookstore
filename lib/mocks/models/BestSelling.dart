class BestSellingModel {
  String id;
  String name;
  double price;
  double salePrice;
  String pictureUrl;
  String authorId;
  String authorName;
  String languageId;
  String languageName;
  String attributeId;
  String attributeName;

  BestSellingModel(
      this.id,
      this.name,
      this.price,
      this.salePrice,
      this.pictureUrl,
      this.authorId,
      this.authorName,
      this.languageId,
      this.languageName,
      this.attributeId,
      this.attributeName);
}

List<BestSellingModel> listBestselling = [
  BestSellingModel(
      "efe60856-0f24-4d4c-1183-08d9ad670aa9",
      "The Alchemist",
      200,
      0,
      "https://firebasestorage.googleapis.com/v0/b/internship-august-2021-b1566.appspot.com/o/harry_potter_and_the_goblet_of_fire_book_4_.jpg?alt=media&token=1449641d-45de-4007-8548-631024f87f36",
      "72bd2a16-5917-4a70-e785-08d9ad670a49",
      "Paulo Coelho",
      "4ad8eed6-fac9-4ed3-1ccb-08d9ad670a54",
      "English",
      "234ef852-5f5d-490f-e149-08d9ad670a2a",
      "Paperback"),
  BestSellingModel(
      "ab4ecc42-81b7-446d-6191-08d9c7022889",
      "Loki: Agent of Asgard - The Complete Collection",
      35.99,
      26.35,
      "https://res.cloudinary.com/dnjhqv3qw/image/upload/v1639903058/rjmpwbgiwjs6saxkfemj.jpg",
      "312c4316-2d1f-49ed-7d99-08d9c7022842",
      "Jojo Moyes",
      "de1f31ff-b94c-43dd-2ced-08d9c702285e",
      "English",
      "a0dc0933-fe6a-4a92-91c3-08d9c7022837",
      "Paperback"),
  BestSellingModel(
      "e2ac33c1-9687-492e-6184-08d9c7022889",
      "Harry Potter Part 4: Harry Potter And The Goblet Of Fire",
      12.99,
      6.92,
      "https://res.cloudinary.com/dnjhqv3qw/image/upload/v1638280759/b94e8848ea41470c767f0266604975c4_ogeezy.jpg",
      "afc0534d-2095-449d-7d96-08d9c7022842",
      "J. K. Rowling",
      "de1f31ff-b94c-43dd-2ced-08d9c702285e",
      "English",
      "a0dc0933-fe6a-4a92-91c3-08d9c7022837",
      "Paperback")
];

List<BestSellingModel> newRelease = [
  BestSellingModel(
      "efe60856-0f24-4d4c-1183-08d9ad670aa9",
      "The Alchemist",
      200,
      0,
      "https://i.pinimg.com/originals/20/c6/11/20c6117cbd73b736baa80c51217c7bea.jpg",
      "72bd2a16-5917-4a70-e785-08d9ad670a49",
      "Paulo Coelho",
      "4ad8eed6-fac9-4ed3-1ccb-08d9ad670a54",
      "English",
      "234ef852-5f5d-490f-e149-08d9ad670a2a",
      "Paperback"),
  BestSellingModel(
      "ab4ecc42-81b7-446d-6191-08d9c7022889",
      "Loki: Agent of Asgard - The Complete Collection",
      35.99,
      26.35,
      "https://upload.wikimedia.org/wikipedia/vi/5/5b/Captain_Marvel_%282019%29-Poster_Ti%E1%BA%BFng_Vi%E1%BB%87t_Ch%C3%ADnh_Th%E1%BB%A9c.jpeg",
      "312c4316-2d1f-49ed-7d99-08d9c7022842",
      "Jojo Moyes",
      "de1f31ff-b94c-43dd-2ced-08d9c702285e",
      "English",
      "a0dc0933-fe6a-4a92-91c3-08d9c7022837",
      "Paperback"),
  BestSellingModel(
      "e2ac33c1-9687-492e-6184-08d9c7022889",
      "Harry Potter Part 4: Harry Potter And The Goblet Of Fire",
      12.99,
      6.92,
      "https://static.wikia.nocookie.net/ab600070-93f3-47c8-9593-56471cbf1d3f",
      "afc0534d-2095-449d-7d96-08d9c7022842",
      "J. K. Rowling",
      "de1f31ff-b94c-43dd-2ced-08d9c702285e",
      "English",
      "a0dc0933-fe6a-4a92-91c3-08d9c7022837",
      "Paperback"),
  BestSellingModel(
      "ab4ecc42-81b7-446d-6191-08d9c7022889",
      "Loki: Agent of Asgard - The Complete Collection",
      35.99,
      26.35,
      "https://upload.wikimedia.org/wikipedia/vi/5/5b/Captain_Marvel_%282019%29-Poster_Ti%E1%BA%BFng_Vi%E1%BB%87t_Ch%C3%ADnh_Th%E1%BB%A9c.jpeg",
      "312c4316-2d1f-49ed-7d99-08d9c7022842",
      "Jojo Moyes",
      "de1f31ff-b94c-43dd-2ced-08d9c702285e",
      "English",
      "a0dc0933-fe6a-4a92-91c3-08d9c7022837",
      "Paperback"),
  BestSellingModel(
      "e2ac33c1-9687-492e-6184-08d9c7022889",
      "Harry Potter Part 4: Harry Potter And The Goblet Of Fire",
      12.99,
      6.92,
      "https://static.wikia.nocookie.net/ab600070-93f3-47c8-9593-56471cbf1d3f",
      "afc0534d-2095-449d-7d96-08d9c7022842",
      "J. K. Rowling",
      "de1f31ff-b94c-43dd-2ced-08d9c702285e",
      "English",
      "a0dc0933-fe6a-4a92-91c3-08d9c7022837",
      "Paperback"),
  BestSellingModel(
      "ab4ecc42-81b7-446d-6191-08d9c7022889",
      "Loki: Agent of Asgard - The Complete Collection",
      35.99,
      26.35,
      "https://upload.wikimedia.org/wikipedia/vi/5/5b/Captain_Marvel_%282019%29-Poster_Ti%E1%BA%BFng_Vi%E1%BB%87t_Ch%C3%ADnh_Th%E1%BB%A9c.jpeg",
      "312c4316-2d1f-49ed-7d99-08d9c7022842",
      "Jojo Moyes",
      "de1f31ff-b94c-43dd-2ced-08d9c702285e",
      "English",
      "a0dc0933-fe6a-4a92-91c3-08d9c7022837",
      "Paperback"),
  BestSellingModel(
      "e2ac33c1-9687-492e-6184-08d9c7022889",
      "Harry Potter Part 4: Harry Potter And The Goblet Of Fire",
      12.99,
      6.92,
      "https://static.wikia.nocookie.net/ab600070-93f3-47c8-9593-56471cbf1d3f",
      "afc0534d-2095-449d-7d96-08d9c7022842",
      "J. K. Rowling",
      "de1f31ff-b94c-43dd-2ced-08d9c702285e",
      "English",
      "a0dc0933-fe6a-4a92-91c3-08d9c7022837",
      "Paperback")
];
