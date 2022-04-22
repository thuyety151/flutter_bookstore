class Attribute {
  String id;
  String name;
  double price;
  int totalStock;
  double salePrice;
  String salePriceStartDate;
  String salePriceEndDate;

  Attribute(
      {required this.id,
      required this.name,
      required this.price,
      required this.salePrice,
      required this.salePriceEndDate,
      required this.salePriceStartDate,
      required this.totalStock});

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
        id: json["id"],
        name: json["name"],
        price: json["price"].toDouble(),
        salePrice: json["salePrice"].toDouble(),
        salePriceEndDate: json["salePriceEndDate"],
        salePriceStartDate: json["salePriceStartDate"],
        totalStock: json["totalStock"]);
  }
}
