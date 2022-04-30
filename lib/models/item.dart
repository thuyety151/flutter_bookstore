enum StockStatus {
  // ignore: constant_identifier_names
  InStock
}

class Item {
  String id;
  String productId;
  String productName;
  String authorId;
  String authorName;
  String attributeId;
  String attributeName;
  String pictureUrl;
  double price;
  int quantity;
  String stockStatus;

  Item(
      {required this.id,
      required this.price,
      required this.attributeId,
      required this.attributeName,
      required this.authorId,
      required this.authorName,
      required this.pictureUrl,
      required this.productId,
      required this.productName,
      required this.quantity,
      required this.stockStatus});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json["id"],
      price: json["price"].toDouble(),
      attributeId: json["attributeId"],
      attributeName: json["attributeName"],
      authorId: json["authorId"],
      authorName: json["authorName"],
      pictureUrl: json["pictureUrl"],
      productId: json["productId"],
      productName: json["productName"],
      quantity: json["quantity"].toInt(),
      stockStatus: json["stockStatus"],
    );
  }
  static Item fromJsonModel(Map<String, dynamic> json) => Item.fromJson(json);
}
