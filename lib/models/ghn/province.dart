class Province {
  int provinceId;
  String provinceName;

  Province({required this.provinceId, required this.provinceName});

  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(
        provinceId: json["ProvinceID"] as int,
        provinceName: json["ProvinceName"]);
  }

  static Province fromJsonModel(Map<String, dynamic> json) =>
      Province.fromJson(json);
}
