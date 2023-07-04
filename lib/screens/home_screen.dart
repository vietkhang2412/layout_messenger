import 'package:flutter/material.dart';
import 'package:layout_messenger/pages/calls_page.dart';
import 'package:layout_messenger/pages/contacts_page.dart';
import 'package:layout_messenger/pages/messages_page.dart';
import 'package:layout_messenger/pages/news_age.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pages = [MessengesPage(), CallsPage(), ContactsPage(), NewsPage()];

  var index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          Container(
            alignment: Alignment.center,
            width: 300,
            child: Text(
              "Đoạn chat",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Icon(
              Icons.edit_square,
              color: Color.fromARGB(255, 7, 135, 255),
            ),
          )
        ],
      ),
      body: pages[index],
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: MessagerBottomSheet(
          onItemSelected: (i) {
            setState(() {
              index = i;
            });
          },
        ),
      ),
    );
  }
}
