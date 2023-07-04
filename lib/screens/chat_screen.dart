import 'package:flutter/material.dart';
import '../models/recent.model.dart';
import 'package:faker/faker.dart';
import '../widgets/widgets.dart';

class ChatScreen extends StatelessWidget {
  static Route route(RecentMessages data) =>
      MaterialPageRoute(builder: (context) => ChatScreen(messageData: data));

  const ChatScreen({super.key, required this.messageData});

  final RecentMessages messageData;

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
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 70.0),
        child: Column(children: [
          ChatBuddleReceiver(messageLeft: faker.conference.name()),
          ChatBuddleSend(messageRight: faker.conference.name()),
          ChatBuddleSend(messageRight: faker.conference.name()),
          ChatBuddleReceiver(messageLeft: faker.conference.name()),
          ChatBuddleReceiver(messageLeft: faker.conference.name()),
          ChatBuddleReceiver(messageLeft: faker.conference.name()),
          ChatBuddleSend(messageRight: faker.conference.name()),
          ChatBuddleReceiver(messageLeft: faker.conference.name()),
          ChatBuddleSend(messageRight: "Bye Bye"),
          ChatBuddleSend(messageRight: "See you again!"),
        ]),
      ),
      bottomSheet: ChatBottomSheet(),
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
