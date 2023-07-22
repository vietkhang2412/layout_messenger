import 'dart:async';

import 'package:layout_messenger/blocs/chat_screen_bloc/chat_event.dart';
import 'package:layout_messenger/blocs/chat_screen_bloc/chat_state.dart';
import 'package:layout_messenger/models/message.model.dart';

class ChatBloc {
  final _stateController = StreamController<ChatState>();
  Stream<ChatState> get state => _stateController.stream;
  final List<Message> _listMessage = [];

  void dispose() {
    _stateController.close();
  }

  void onAction(ChatEvent action, Message message) {
    switch (action) {
      case ChatEvent.send:
        sendMessage(message);
        break;
      case ChatEvent.receiver:
        receiverMessage(message);
        break;

      default:
        break;
    }
  }

  void sendMessage(Message message) async {
    _stateController.sink.add(ChatState.isPerson(_listMessage));
    _listMessage.add(message);
  }

  void receiverMessage(Message message) async {
    _stateController.sink.add(ChatState.isBot(_listMessage));
    _listMessage.add(message);
  }
}
