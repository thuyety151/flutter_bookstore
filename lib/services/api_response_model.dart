class ApiResponse<T> {
  final String? error;
  final List<T>? data;
  final String? message;

  ApiResponse({this.error, this.data, this.message});

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, Function fromJsonModel) {
    final listData = json['data'] != null
        ? json['data'].cast<Map<String, dynamic>>()
        : json['value'].cast<Map<String, dynamic>>();

    return ApiResponse(
        error: json["error"] ?? "",
        data: List<T>.from(listData.map((e) => fromJsonModel(e))),
        message: json["message"]);
  }
}

class AuthenResponse {
  final String? firstName;
  final String? lastName;
  final String token;
  final String email;
  final String role;

  AuthenResponse(
      {this.firstName,
      this.lastName,
      required this.token,
      required this.email,
      required this.role});

  factory AuthenResponse.fromJson(
      Map<String, dynamic> json, Function fromJsonModel) {
    return AuthenResponse(
      firstName: json["firstName"] ?? "",
      lastName: json["lastName"] ?? "",
      token: json["token"],
      email: json["email"],
      role: json["role"],
    );
  }
  static int getStatusCode(Map<String, dynamic> json) {
    return json["status"] ?? 0;
  }
}
