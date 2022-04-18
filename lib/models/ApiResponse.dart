class ApiResponse<T> {
  final String? error;
  final List<T>? data;
  final String? message;

  ApiResponse({this.error, this.data, this.message});

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, Function fromJsonModel) {
    print(json["error"]);
    final listData = json['data'].cast<Map<String, dynamic>>();

    return ApiResponse(
      error: json["error"],
      data: new List<T>.from(listData.map((e) => fromJsonModel(e))),
      message: json["message"],
    );
  }
}
