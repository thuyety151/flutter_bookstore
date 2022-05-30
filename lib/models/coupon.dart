class Coupon {
  late String id;
  late String code;
  late String description;
  late int couponAmount;
  late int discountType;
  late String expireDate;
  late String imageUrl;
  late int minSpend;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['description'] = this.description;
    data['couponAmount'] = this.couponAmount;
    data['discountType'] = this.discountType;
    data['expireDate'] = this.expireDate;
    data['imageUrl'] = this.imageUrl;
    data['minSpend'] = this.minSpend;
    return data;
  }
}
