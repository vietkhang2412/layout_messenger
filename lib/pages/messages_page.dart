import 'package:flutter/material.dart';
import 'package:layout_messenger/models/models.dart';
import 'package:layout_messenger/screens/screens.dart';
import 'package:faker/faker.dart';

class MessengesPage extends StatelessWidget {
  const MessengesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          findMessages(),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 90,
                      child: _StoryItem(
                          storyData: Story(
                              name: faker.person.name(),
                              url: "https://picsum.photos/200/300")),
                    );
                  }),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          for (int i = 0; i < 20; i++)
            _RecentItem(
              recentMessages: RecentMessages(
                  name: faker.person.name(),
                  image: faker.image.image(width: 50, height: 50, random: true),
                  content: faker.conference.name(),
                  date: faker.date.justTime()),
            ),
        ],
      ),
    );
  }
}

class findMessages extends StatelessWidget {
  const findMessages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(25),
        ),
        width: 400,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: TextFormField(
            decoration: InputDecoration(
                icon: Icon(Icons.search),
                hintText: "Tìm người, kênh và hơn thế nữa...",
                border: InputBorder.none),
          ),
        ),
      ),
    );
  }
}

class _StoryItem extends StatelessWidget {
  const _StoryItem({required this.storyData});

  final Story storyData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blue,
          child: CircleAvatar(
            backgroundImage: NetworkImage(storyData.url),
            radius: 28,
          ),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(top: 16.0, left: 5, right: 5),
          child: Text(
            storyData.name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ))
      ],
    );
  }
}

class _RecentItem extends StatelessWidget {
  const _RecentItem({required this.recentMessages});

  final RecentMessages recentMessages;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(recentMessages.image),
        radius: 28,
      ),
      title: Text(recentMessages.name),
      subtitle: Row(children: [
        SizedBox(
          width: 200,
          child: Text(
            recentMessages.content,
            style: TextStyle(overflow: TextOverflow.ellipsis),
          ),
        ),
        SizedBox(
          width: 30,
        ),
        Text(recentMessages.date)
      ]),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.blue),
      ),
      onTap: () =>
          {Navigator.of(context).push(ChatScreen.route(recentMessages))},
    );
  }
}
