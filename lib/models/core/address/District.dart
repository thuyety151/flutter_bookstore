class District {
  int districtID;
  int provinceID;
  String districtName;
  String code;
  List<String> nameExtension;

  District(
      {required this.districtID,
      required this.provinceID,
      required this.districtName,
      required this.code,
      required this.nameExtension});

  Map<String, dynamic> toMap() {
    return {
      'districtID': districtID,
      'districtName': districtName,
      'provinceID': provinceID,
      'code': code,
      'nameExtension': nameExtension
    };
  }

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
        districtID: json["DistrictID"],
        districtName: json["DistrictName"],
        provinceID: json["ProvinceID"],
        code: json["code"].toString(),
        nameExtension: json["nameExtension"] ?? []);
  }

  static District fromJsonModel(Map<String, dynamic> json) =>
      District.fromJson(json);
}
