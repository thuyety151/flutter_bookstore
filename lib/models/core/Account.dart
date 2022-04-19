class Account {
  String id;
  String firstName;
  String lastName;
  String email;

  Account(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email});

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"]);
  }

  static Account fromJsonModel(Map<String, dynamic> json) =>
      Account.fromJson(json);
}
