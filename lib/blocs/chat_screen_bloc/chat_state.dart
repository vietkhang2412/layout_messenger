import 'package:layout_messenger/models/message.model.dart';

class ChatState {
  final List<Message> messages;
  final bool isBot;

  ChatState({required this.messages, required this.isBot});

  factory ChatState.isBot(List<Message> messages) {
    return ChatState(messages: messages, isBot: true);
  }
  factory ChatState.isPerson(List<Message> messages) {
    return ChatState(messages: messages, isBot: false);
  }
}
