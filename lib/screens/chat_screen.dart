import 'package:flutter/material.dart';
import 'package:layout_messenger/blocs/chat_screen_bloc/chat_bloc.dart';
import 'package:layout_messenger/blocs/chat_screen_bloc/chat_state.dart';
import 'package:layout_messenger/models/message.model.dart';
import '../models/recent.model.dart';
import '../widgets/widgets.dart';

class ChatScreen extends StatelessWidget {
  static Route route(RecentMessages data) =>
      MaterialPageRoute(builder: (context) => ChatScreen(messageData: data));

  ChatScreen({super.key, required this.messageData});

  final RecentMessages messageData;

  var chat_bloc = ChatBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color.fromARGB(255, 7, 135, 255),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [AppBarChat(messageData: messageData)],
        ),
      ),
      body: StreamBuilder(
        stream: chat_bloc.state,
        builder: (context, snapshot) {
          ChatState? state = snapshot.data;
          if (snapshot.hasData) {
            return Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 70),
              child: Expanded(
                child: ListView.builder(
                  itemCount: state!.messages.length,
                  itemBuilder: (context, index) {
                    Message message = state.messages[index];
                    return state.isBot
                        ? ChatBuddleReceiver(messageLeft: message.text)
                        : ChatBuddleSend(messageRight: message.text);
                  },
                ),
              ),
            );
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(messageData.image),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      messageData.name,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Facebook",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Các bạn là bạn bè trên facebook")
                  ],
                ),
              ),
            );
          }
        },
      ),
      bottomSheet: ChatBottomSheet(
        chat_bloc: chat_bloc,
      ),
    );
  }
}

class AppBarChat extends StatelessWidget {
  const AppBarChat({
    super.key,
    required this.messageData,
  });

  final RecentMessages messageData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            // color: Colors.red,

            width: 230,
            child: ListTile(
              leading: SizedBox(
                width: 45,
                height: 45,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue,
                  backgroundImage: NetworkImage(messageData.image),
                ),
              ),
              title: Text(
                messageData.name,
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold),
              ),
              // subtitle: Text(
              //   "Đang hoạt động",
              //   style: TextStyle(color: Colors.lightGreen),
              // ),
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.phone,
                size: 30,
                color: Color.fromARGB(255, 7, 135, 255),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.videocam,
                size: 30,
                color: Color.fromARGB(255, 7, 135, 255),
              )
            ],
          ),
        ],
      ),
    );
  }
}
