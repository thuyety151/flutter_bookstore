class Ward {
  String wardCode;
  int districtId;
  String wardName;

  Ward(
      {required this.wardCode,
      required this.districtId,
      required this.wardName});

  factory Ward.fromJson(Map<String, dynamic> json) {
    return Ward(
        wardCode: json["WardCode"],
        districtId: json["DistrictID"].toInt(),
        wardName: json["WardName"]);
  }

  static Ward fromJsonModel(Map<String, dynamic> json) => Ward.fromJson(json);
}
