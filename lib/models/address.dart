import 'dart:convert';

class Address {
  String? id;
  String? firstName;
  String? lastName;
  String? phone;
  String? apartmentNumber;
  String? streetAddress;
  String? districtID;
  String? provinceID;
  String? wardName;
  String? districtName;
  String? provinceName;
  bool? isMain;

  Address(
      {this.id,
      this.firstName,
      this.lastName,
      this.phone,
      this.apartmentNumber,
      this.streetAddress,
      this.districtID,
      this.provinceID,
      this.districtName,
      this.isMain,
      this.provinceName,
      this.wardName}) {
    isMain = isMain ?? false;
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json["id"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      phone: json["phone"],
      apartmentNumber: json["apartmentNumber"],
      streetAddress: json["streetAddress"],
      districtID: json["districtID"],
      districtName: json["districtName"],
      provinceID: json["provinceID"],
      isMain: json["isMain"],
      provinceName: json["provinceName"],
      wardName: json["wardName"],
    );
  }

  static Address fromJsonModel(Map<String, dynamic> json) =>
      Address.fromJson(json);

  String toJson() {
    Map<String, dynamic> map = {
      "firstName": firstName,
      "lastName": lastName,
      "phone": phone,
      "apartmentNumber": apartmentNumber,
      "streetAddress": streetAddress,
      "districtID": int.parse(districtID ?? "0"),
      "provinceID": int.parse(provinceID ?? "0"),
      "isMain": isMain,
      "provinceName": provinceName,
      "districtName": districtName,
      "wardName": wardName,
    };
    return json.encode(map);
  }

  Map mapToJson() => {
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

  String get fullAddress {
    var data = [
      "appartmentNumber",
      "streetAddress",
      "districtName",
      "provinceName"
    ].map((e) => mapToJson()[e]);
    return data.where((element) => element != null).join(", ");
  }

  String get fullName {
    return "$firstName $lastName";
  }
}
