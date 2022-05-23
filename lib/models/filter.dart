class Filter {
  String? categoryId;
  String? attributeId;
  String? authorId;
  String? languageId;
  late double minPrice;
  late double maxPrice;
  late int rate;
  late int pageIndex;
  late int pageSize;

  Filter(
      {this.categoryId,
      this.attributeId,
      this.languageId,
      this.authorId,
      required this.maxPrice,
      required this.minPrice,
      required this.rate,
      required this.pageIndex,
      required this.pageSize
      });

  Filter.empty() {
    attributeId = null;
    categoryId = null;
    languageId = null;
    maxPrice = 0;
    minPrice = 0;
    rate = 0;
    pageIndex = 1;
    pageSize = 10;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['attributeId'] = this.attributeId;
    data['authorId'] = this.authorId;
    data['languageId'] = this.languageId;
    data['minPrice'] = this.minPrice;
    data['maxPrice'] = this.maxPrice;
    data['rate'] = this.rate;
    data['pageIndex'] = this.pageIndex;
    data['pageSize'] = this.pageSize;
    return data;
  }
}
