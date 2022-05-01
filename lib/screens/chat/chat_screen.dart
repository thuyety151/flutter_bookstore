import 'package:flutter/material.dart';
import 'package:flutter_folder/components/coustom_bottom_nav_bar.dart';
import 'package:flutter_folder/enums.dart';
import 'package:flutter_folder/models/account.dart';
import 'package:flutter_folder/provider/account_model.dart';
import 'package:flutter_folder/services/authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:signalr_netcore/signalr_client.dart';

import '../../provider/chat_provider.dart';
import 'components/received_message.dart';
import 'components/sent_message.dart';

class ChatScreen extends StatefulWidget {
  //final Account onlineUser;
  const ChatScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ChatScreenState();
  }
}

// class IncomingChatMessageParams {
//   String fromId;
//   String toId;
//   String message;

//   IncomingChatMessageParams({required this.fromId, required this.toId, required this.message);

//   String toJson() {
//     Map<String, dynamic> map = {
//       "fromId": fromId.trim(),
//       "toId": toId.trim(),
//       "message": message.trim()
//     };
//     return json.encode(map);
//   }
// }

class _ChatScreenState extends State<ChatScreen> {
  ScrollController _scrollController = new ScrollController();
  final myController = TextEditingController();

  // List<String> chats;
  // HubConnection connection;
  @override
  void initState() {
    super.initState();
    //chats = new List();
    //createSignalRConnection();
  }

  // Future<void> createSignalRConnection() async {
  //   connection =
  //       new HubConnectionBuilder().withUrl("https://localhost:5001/chat").build();
  //   await connection.start();
  //   connection.invoke("SendMessage");
  //   connection.on("ReceiveMessage", (data) {
  //    // chats.add(data[0]);
  //     setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final Account onlineUser = Account(
        id: "1",
        firstName: 'Truong',
        lastName: 'Nguyen',
        email: 'nguyentruong.120300@gmail.com');
    final chatStte = Provider.of<ChatProvider>(context);
    final authstate = Provider.of<AccountModel>(context);
    if (authstate.getisUserLogedIn() == true) {
      chatStte.createSignalRConnection(authstate.getUserLoginDetails());
    }

    final filtredMessages = chatStte.getMessages();
    // .where((message) {
    //   return (message.toId == onlineUser.id &&
    //           message.fromId ==
    //               authstate.getUserLoginDetails().id) ||
    //       (message.toId == authstate.getUserLoginDetails().id &&
    //           message.fromId == onlineUser.id);
    // }).toList();
    // filtredMessages.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return Scaffold(
        appBar: AppBar(
          title: Text(onlineUser.firstName),
        ),
        body: Column(
          children: <Widget>[
            Consumer<ChatProvider>(
              builder: (context, value, child) {
                return new Flexible(
                    child: ListView.builder(
                  controller: _scrollController,
                  reverse: true,
                  // shrinkWrap: true,
                  itemCount: filtredMessages.length,
                  itemBuilder: (context, int index) {
                    double cWidth = MediaQuery.of(context).size.width * 0.8;
                    if (filtredMessages[index].toId ==
                        authstate.getUserLoginDetails().id) {
                      return Container(
                          padding: const EdgeInsets.all(16.0),
                          width: cWidth,
                          child: ReceivedMessage(
                              chatMessage: filtredMessages[index]));
                    }
                    return Container(
                        padding: const EdgeInsets.all(16.0),
                        width: cWidth,
                        child:
                            SentMessage(chatMessage: filtredMessages[index]));
                  },
                ));
              },
            ),

            // VideoPlayer(),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.attach_file),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextFormField(
                      autofocus: false,
                      controller: myController,
                      decoration: new InputDecoration(
                        labelText: "Type a message",
                      ),
                      keyboardType: TextInputType.text),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.send,
                    color: Theme.of(context).primaryColor,
                  ),
                  onTap: () {
                    chatStte.sendChatMessage({
                      // "to": onlineUser,
                      // "from": authstate.getUserLoginDetails().userDetails,
                      "fromId": "7e0b9627-b339-441d-b6dc-14f9b65b2dac",
                      "toId": "40bcc085-b655-4286-8e46-ac313f0c40fe",
                      "message": myController.text
                    });
                    myController.clear();
                  },
                )
              ],
            ),
            CustomBottomNavBar(selectedMenu: MenuState.message)
          ],
        ));
  }

  @override
  void dispose() {
    myController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
