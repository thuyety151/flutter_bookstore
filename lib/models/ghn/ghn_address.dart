class GHNAddress {
  int? districtId;
  int? serviceId;
  String? serviceTypeId;
  int? shopId;
  String? wardCode;

  GHNAddress(
      {districtId,
      serviceId,
      serviceTypeId,
      shopId,
      wardCode});

  GHNAddress.fromJson(Map<String, dynamic> json) {
    districtId = json['district_id'];
    serviceId = json['service_id'];
    serviceTypeId = json['service_type_id'];
    shopId = json['shop_id'];
    wardCode = json['ward_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['district_id'] = districtId;
    data['service_id'] = serviceId;
    data['service_type_id'] = serviceTypeId;
    data['shop_id'] = shopId;
    data['ward_code'] = wardCode;
    return data;
  }
}

var shopAddress = GHNAddress(
    districtId: 3695,
    serviceId: 53320,
    serviceTypeId: null,
    shopId: 82749,
    wardCode: "90737");
