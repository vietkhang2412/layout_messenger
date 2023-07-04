import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class ChatBuddleReceiver extends StatelessWidget {
  const ChatBuddleReceiver({Key? key, required this.messageLeft})
      : super(key: key);

  final String messageLeft;
  @override
  Widget build(BuildContext context) {
    return ChatBubble(
      clipper: ChatBubbleClipper5(type: BubbleType.receiverBubble),
      backGroundColor: Color(0xffE7E7ED),
      margin: EdgeInsets.only(top: 10),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Text(
          messageLeft,
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
    );
  }
}
