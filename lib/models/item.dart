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
  Null? orderId;
  Null? order;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['authorId'] = this.authorId;
    data['authorName'] = this.authorName;
    data['attributeId'] = this.attributeId;
    data['attributeName'] = this.attributeName;
    data['pictureUrl'] = this.pictureUrl;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['stockStatus'] = this.stockStatus;
    data['orderId'] = this.orderId;
    data['order'] = this.order;
    return data;
  }
}