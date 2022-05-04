class Filter {
  String? categoryId;
  String? attributeId;
  String? authorId;
  String? languageId;
  late double minPrice;
  late double maxPrice;
  int? rate;

  Filter(
      {this.categoryId,
      this.attributeId,
      this.languageId,
      this.authorId,
      required this.maxPrice,
      required this.minPrice,
      this.rate});

  Filter.empty() {
    attributeId = null;
    categoryId = null;
    languageId = null;
    maxPrice = 0;
    minPrice = 0;
    rate = null;
  }
}
