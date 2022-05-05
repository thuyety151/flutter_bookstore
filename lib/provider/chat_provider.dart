import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_folder/models/account.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:signalr_netcore/signalr_client.dart';
import 'package:http/http.dart';
import '../models/chat_message.dart';

class ChatProvider with ChangeNotifier {
  static const bookStoreLocalEndpoint = "https://localhost:5001/chat";
  bool _isConnected = false;

  //ChatProvider();

  List<ChatMessage> _messages = [];
  List<ChatMessage> getMessages() => _messages;
  late HubConnection _connection;
  String token = "";

  bool getIsConnected() {
    return _isConnected;
  }

  void addChatMessage(ChatMessage chatMessage) {
    _messages.add(chatMessage);
  }

  void sendChatMessage(Map<String, dynamic> outgoingMessage) {
    try {
      _connection.invoke("SendMessage", args: [outgoingMessage]);
      print("success");
      _messages.add(
        ChatMessage(
          id: 1,
          message: outgoingMessage["message"],
          type: 'text',
          fromId: 1,
          toId: 2,
          createdAt: '30/04/2022',
          fromUserName: 'Truong Nguyen',
          toUserName: 'Thuyet Y',
        ),
      );
      notifyListeners();
    } catch (error) {
      print(error);
    }
    //_connection.invoke("SendMessage", args: [outgoingMessage]);
    // post(Uri.parse("$bookStoreLocalEndpoint"),
    //         headers: {
    //           "Content-Type": "application/json",
    //           //"Authorization": "Bearer $token"
    //         },
    //         body: jsonEncode(outgoingMessage))
    //     .then((response) {
    //       print("response :" + response.body);
    //     });
  }

  Future<void> createSignalRConnection(Account authUserDetails) async {
    // Create storage
    final storage = new FlutterSecureStorage();

    // Read value
    String? value = await storage.read(key: 'token');
    _connection =
        new HubConnectionBuilder().withUrl("$bookStoreLocalEndpoint").build();
    await _connection.start();

    _connection.on("ReceiveMessage", (data) {
      print("receive");
      var dataFromJson = jsonDecode(jsonEncode(data![0]));
      print(ChatMessage.fromJson(dataFromJson));
      _messages.add(ChatMessage.fromJson(dataFromJson));
      _messages.add(
        ChatMessage(
          id: 1,
          message: 'This is a message',
          type: 'text',
          fromId: 1,
          toId: 2,
          createdAt: '30/04/2022',
          fromUserName: 'Truong Nguyen',
          toUserName: 'Lich Ngo',
        ),
      );
      notifyListeners();
    });
  }
}
