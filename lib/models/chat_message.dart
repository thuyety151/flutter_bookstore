class ChatMessage {
  int id;
  String message;
  String type;
  int fromId;
  int toId;
  String createdAt;
  String fromUserName;
  String toUserName;

  ChatMessage(
      {required this.id,
      required this.message,
      required this.type,
      required this.fromId,
      required this.toId,
      required this.createdAt,
      required this.fromUserName,
      required this.toUserName});

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return new ChatMessage(
        id: json["id"],
        message: json["message"],
        type: json["type"],
        fromId: json["fromId"],
        toId: json["toId"],
        createdAt: json["createdAt"],
        fromUserName: json["fromUserName"],
        toUserName: json["toUserName"]);
  }
}
