import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class ChatBuddleSend extends StatelessWidget {
  const ChatBuddleSend({Key? key, required this.messageRight})
      : super(key: key);

  final String messageRight;
  @override
  Widget build(BuildContext context) {
    return ChatBubble(
      clipper: ChatBubbleClipper5(type: BubbleType.sendBubble),
      alignment: Alignment.topRight,
      margin: EdgeInsets.only(top: 10),
      backGroundColor: Colors.blue,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Text(
          messageRight,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
