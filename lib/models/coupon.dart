class Coupon {
  late String id;
  late String code;
  late String description;
  late int couponAmount;
  late int discountType;
  late String expireDate;
  late String imageUrl;
  late int minSpend;

  Coupon.empty() {
    id = "";
    code = "";
    description = "";
    couponAmount = 0;
    discountType = 0;
    expireDate = "";
    imageUrl = "";
    minSpend = 0;
  }

  Coupon(
      {required this.id,
      required this.code,
      required this.description,
      required this.couponAmount,
      required this.discountType,
      required this.expireDate,
      required this.imageUrl,
      required this.minSpend});

  Coupon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    description = json['description'];
    couponAmount = json['couponAmount'];
    discountType = json['discountType'];
    expireDate = json['expireDate'];
    imageUrl = json['imageUrl'] ?? "";
    minSpend = json['minSpend'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['description'] = description;
    data['couponAmount'] = couponAmount;
    data['discountType'] = discountType;
    data['expireDate'] = expireDate;
    data['imageUrl'] = imageUrl;
    data['minSpend'] = minSpend;
    return data;
  }
}
