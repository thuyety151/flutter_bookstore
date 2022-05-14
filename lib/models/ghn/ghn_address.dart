class GHNAddress {
  int? districtId;
  int? serviceId;
  String? serviceTypeId;
  int? shopId;
  String? wardCode;

  GHNAddress(
      {this.districtId,
      this.serviceId,
      this.serviceTypeId,
      this.shopId,
      this.wardCode});

  GHNAddress.fromJson(Map<String, dynamic> json) {
    districtId = json['district_id'];
    serviceId = json['service_id'];
    serviceTypeId = json['service_type_id'];
    shopId = json['shop_id'];
    wardCode = json['ward_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['district_id'] = this.districtId;
    data['service_id'] = this.serviceId;
    data['service_type_id'] = this.serviceTypeId;
    data['shop_id'] = this.shopId;
    data['ward_code'] = this.wardCode;
    return data;
  }
}

var shopAddress = GHNAddress(
    districtId: 3695,
    serviceId: 53320,
    serviceTypeId: null,
    shopId: 82749,
    wardCode: "90737");
