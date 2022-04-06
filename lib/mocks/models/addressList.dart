import 'package:flutter/material.dart';

class AddressModel {
  String id;
  String firstName;
  String lastName;
  String phone;
  String apartmentNumber;
  String streetAddress;
  int districtID;
  int provinceID;
  String wardName;
  String districtName;
  String provinceName;
  bool isMain;

  AddressModel(
      this.id,
      this.firstName,
      this.lastName,
      this.phone,
      this.apartmentNumber,
      this.streetAddress,
      this.districtID,
      this.provinceID,
      this.wardName,
      this.districtName,
      this.provinceName,
      this.isMain);

  String fullAddress() {
    var data = [
      "appartmentNumber",
      "streetAddress",
      "districtName",
      "provinceName"
    ].map((e) => this.toJson()[e]);
    return data.where((element) => element != null).join(", ");
  }

  String fullName() {
    return this.firstName + " " + this.lastName;
  }

  Map toJson() => {
        'id': id,
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "apartmentNumber": apartmentNumber,
        "streetAddress": streetAddress,
        "districtID": districtID,
        "districtName": districtName,
        "provinceName": provinceName,
      };
}

List<AddressModel> listAddress = [
  AddressModel(
      "9d262ecd-cffa-4044-397d-08d9993e6508",
      "Truong",
      "Nguyen",
      "0866944171",
      "54",
      "So 8",
      3695,
      202,
      "Phường Linh Chiểu",
      "Thành Phố Thủ Đức",
      "Hồ Chí Minh",
      true),
  AddressModel(
      "9d262ecd-cffa-4044-397d-08d9993e6508",
      "Truong",
      "Nguyen",
      "0866944171",
      "54",
      "So 8",
      3695,
      202,
      "Phường Linh Chiểu",
      "Thành Phố Thủ Đức",
      "Hồ Chí Minh",
      false),
  AddressModel(
      "9d262ecd-cffa-4044-397d-08d9993e6508",
      "Truong",
      "Nguyen",
      "0866944171",
      "54",
      "So 8",
      3695,
      202,
      "Phường Linh Chiểu",
      "Thành Phố Thủ Đức",
      "Hồ Chí Minh",
      false)
];
