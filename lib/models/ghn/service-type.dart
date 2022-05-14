class ServiceType {
  int? serviceId;
  String? shortName;
  int? serviceTypeId;
  bool isMain = false;

  ServiceType({this.serviceId, this.shortName, this.serviceTypeId, required this.isMain});

  ServiceType.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    shortName = json['short_name'];
    serviceTypeId = json['service_type_id'];
    isMain = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_id'] = serviceId;
    data['short_name'] = shortName;
    data['service_type_id'] = serviceTypeId;
    return data;
  }
}