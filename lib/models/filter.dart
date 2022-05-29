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
  String? keywords;

  Filter(
      {this.categoryId,
      this.attributeId,
      this.languageId,
      this.authorId,
      required this.maxPrice,
      required this.minPrice,
      required this.rate,
      required this.pageIndex,
      required this.keywords,
      required this.pageSize});

  Filter.empty() {
    attributeId = null;
    categoryId = null;
    languageId = null;
    maxPrice = 0;
    minPrice = 0;
    rate = 0;
    pageIndex = 1;
    keywords = "";
    pageSize = 10;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryId'] = categoryId;
    data['attributeId'] = attributeId;
    data['authorId'] = authorId;
    data['languageId'] = languageId;
    data['minPrice'] = minPrice;
    data['maxPrice'] = maxPrice;
    data['rate'] = rate;
    data['pageIndex'] = pageIndex;
    data['pageSize'] = pageSize;
    data['keywords'] = keywords;
    return data;
  }
}
