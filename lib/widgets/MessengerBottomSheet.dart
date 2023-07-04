import 'package:flutter/material.dart';

import 'NavigationBarItem.dart';

class MessagerBottomSheet extends StatelessWidget {
  const MessagerBottomSheet({Key? key, required this.onItemSelected})
      : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavigationBarItem(
              index: 0,
              label: "Đoạn chat",
              icon: Icons.chat_bubble_rounded,
              onTap: onItemSelected,
            ),
            NavigationBarItem(
              index: 1,
              label: "Cuộc gọi",
              icon: Icons.videocam,
              onTap: onItemSelected,
            ),
            NavigationBarItem(
              index: 2,
              label: "Danh bạ",
              icon: Icons.person,
              onTap: onItemSelected,
            ),
            NavigationBarItem(
              index: 3,
              label: "Tin",
              icon: Icons.amp_stories_rounded,
              onTap: onItemSelected,
            )
          ],
        ));
  }
}
