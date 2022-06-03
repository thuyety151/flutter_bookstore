import 'package:flutter_folder/models/address.dart';
import 'package:flutter_folder/models/item.dart';

class Order {
  late String id;
  late String orderDate;
  late String status;
  late String paymentMethod;
  late double subTotal;
  late String orderNote;
  late String orderCode;
  late double orderFee;
  late String userId;
  late String deliveryMethodId;
  //TODO: replace with Coupon
  late Object? coupon;
  late List<Item> items;
  late Address? addressToShip;
  late double total;

  Order(
      {required this.addressToShip,
      required this.coupon,
      required this.deliveryMethodId,
      required this.id,
      required this.items,
      required this.orderCode,
      required this.orderDate,
      required this.orderFee,
      required this.orderNote,
      required this.paymentMethod,
      required this.status,
      required this.subTotal,
      required this.total,
      required this.userId});

  Order.fromJson(Map<String, dynamic> json) {
    final listItems = json["items"].cast<Map<String, dynamic>>() ?? [];

    id = json['id'];
    addressToShip = json['addressToShip'] == null
        ? null
        : Address.fromJson(json['addressToShip']);
    coupon = json['coupon'];
    deliveryMethodId = json['deliveryMethodId'];
    items = List<Item>.from(listItems.map((e) => Item.fromJson(e)));
    orderCode = json['orderCode'] ?? "";
    orderDate = json['orderDate'];
    orderFee = double.parse(json['orderFee']?.toString() ?? "0");
    orderNote = json['orderNote'] ?? "";
    paymentMethod = json['paymentMethod'];
    status = json['status'];
    subTotal = double.parse(json['subTotal'].toString());
    total = double.parse(json['total'].toString());
    userId = json['userId'];
  }
}
