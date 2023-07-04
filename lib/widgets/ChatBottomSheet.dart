import 'package:flutter/material.dart';

class ChatBottomSheet extends StatelessWidget {
  const ChatBottomSheet({super.key});

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
              width: (MediaQuery.of(context).size.width - 30) / 2,
              child: Row(
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
              width: (MediaQuery.of(context).size.width - 30) / 2,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    width: (MediaQuery.of(context).size.width - 120) / 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextFormField(
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
                  Icon(
                    Icons.thumb_up,
                    color: Colors.blue,
                    size: 35,
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
