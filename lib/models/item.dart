// ignore_for_file: prefer_void_to_null

class Item {
  String? id;
  String? productId;
  String? productName;
  String? authorId;
  String? authorName;
  String? attributeId;
  String? attributeName;
  String? pictureUrl;
  num? price;
  int? quantity;
  String? stockStatus;
  Null orderId;
  Null order;

  Item(
      {this.id,
      this.productId,
      this.productName,
      this.authorId,
      this.authorName,
      this.attributeId,
      this.attributeName,
      this.pictureUrl,
      this.price,
      this.quantity,
      this.stockStatus,
      this.orderId,
      this.order});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    productName = json['productName'];
    authorId = json['authorId'];
    authorName = json['authorName'];
    attributeId = json['attributeId'];
    attributeName = json['attributeName'];
    pictureUrl = json['pictureUrl'];
    price = json['price'];
    quantity = json['quantity'];
    stockStatus = json['stockStatus'];
    orderId = json['orderId'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productId'] = productId;
    data['productName'] = productName;
    data['authorId'] = authorId;
    data['authorName'] = authorName;
    data['attributeId'] = attributeId;
    data['attributeName'] = attributeName;
    data['pictureUrl'] = pictureUrl;
    data['price'] = price;
    data['quantity'] = quantity;
    data['stockStatus'] = stockStatus;
    data['orderId'] = orderId;
    data['order'] = order;
    return data;
  }

  Item.params({this.productId, this.attributeId, this.quantity});
}
