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
      "wardName",
      "districtName",
      "provinceName"
    ].map((e) => toJson()[e]);
    return data.where((element) => element != null).join(", ");
  }

  String fullName() {
    return firstName + " " + lastName;
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

