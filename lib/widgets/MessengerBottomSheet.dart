import 'package:flutter/material.dart';

import 'NavigationBarItem.dart';

class MessagerBottomSheet extends StatefulWidget {
  const MessagerBottomSheet({Key? key, required this.onItemSelected})
      : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<MessagerBottomSheet> createState() => _MessagerBottomSheetState();
}

class _MessagerBottomSheetState extends State<MessagerBottomSheet> {
  var setSelected = 0;
  void handleSelected(int index) {
    setState(() {
      setSelected = index;
    });
    widget.onItemSelected(index);
  }

  // final bool isSelected;
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
              onTap: handleSelected,
              isSelected: (setSelected == 0),
            ),
            NavigationBarItem(
              index: 1,
              label: "Cuộc gọi",
              icon: Icons.videocam,
              onTap: handleSelected,
              isSelected: (setSelected == 1),
            ),
            NavigationBarItem(
              index: 2,
              label: "Danh bạ",
              icon: Icons.person,
              onTap: handleSelected,
              isSelected: (setSelected == 2),
            ),
            NavigationBarItem(
              index: 3,
              label: "Tin",
              icon: Icons.amp_stories_rounded,
              onTap: handleSelected,
              isSelected: (setSelected == 3),
            )
          ],
        ));
  }
}
