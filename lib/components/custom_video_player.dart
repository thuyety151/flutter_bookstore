import 'package:flutter/material.dart';

import '../models/chat_message.dart';

class CustomVideoPlayer extends StatefulWidget {
  final ChatMessage chatMessage;

   CustomVideoPlayer({required Key key, required this.chatMessage}) : super(key: key);
  @override
  _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}