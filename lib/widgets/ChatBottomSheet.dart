import 'package:flutter/material.dart';
import 'package:layout_messenger/blocs/chat_screen_bloc/chat_bloc.dart';
import 'package:layout_messenger/models/message.model.dart';

class ChatBottomSheet extends StatefulWidget {
  const ChatBottomSheet({super.key, required this.chat_bloc});

  final ChatBloc chat_bloc;

  @override
  State<ChatBottomSheet> createState() => _ChatBottomSheetState();
}

class _ChatBottomSheetState extends State<ChatBottomSheet> {
  bool flag = false;
  bool send = false;
  TextEditingController messageController = TextEditingController();

  handleFlag() {
    setState(() {
      flag = !flag;
      send = true;
    });
  }

  handleIconFlag() {
    setState(() {
      flag = false;
    });
  }

  sendMessage() {
    widget.chat_bloc.sendMessage(Message("you", messageController.text));
    // Future.delayed(Duration(seconds: 2), () {
    //   widget.chat_bloc.receiverMessage(Message("bot", faker.conference.name()));
    // });

    messageController.clear();
    // widget.chat_bloc.receiverMessage(ChatEvent.receiver);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            SizedBox(
              width: flag ? 40 : (MediaQuery.of(context).size.width - 30) / 2,
              child: flag
                  ? InkWell(
                      onTap: handleFlag,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.blue,
                        size: 35,
                      ),
                    )
                  : Row(
                      children: [
                        Icon(
                          Icons.add_circle,
                          color: Colors.blue,
                          size: 35,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.photo_camera,
                          color: Colors.blue,
                          size: 35,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.image,
                          color: Colors.blue,
                          size: 35,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.mic,
                          color: Colors.blue,
                          size: 35,
                        )
                      ],
                    ),
            ),
            SizedBox(
              width: flag
                  ? MediaQuery.of(context).size.width - 60
                  : (MediaQuery.of(context).size.width - 30) / 2,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    width: flag
                        ? MediaQuery.of(context).size.width - 105
                        : (MediaQuery.of(context).size.width - 120) / 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextFormField(
                        controller: messageController,
                        onTap: handleFlag,
                        onEditingComplete: sendMessage,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Aa",
                            suffixIcon: Icon(
                              Icons.face_sharp,
                              size: 30,
                              color: Colors.blue,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: sendMessage,
                    child: Icon(
                      send ? Icons.send : Icons.thumb_up,
                      color: Colors.blue,
                      size: 35,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
