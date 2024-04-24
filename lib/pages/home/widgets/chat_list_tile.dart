import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kaapi_club/core/images.dart';
import 'package:kaapi_club/pages/home/widgets/chat_tile.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:  [
        GestureDetector(
          onTap: () {
            Get.toNamed("/chatPage");
          },
          child: const ChatTile(
            name: "Sharath",
            imgUrl: ImagesAsset.kaapiImg,
            lastMsg: "I got a job offer yesterday",
            lastMsgTime: "05:30 am",
          ),
        ),
        const ChatTile(
          name: "Sam",
          imgUrl: ImagesAsset.kaapiImg,
          lastMsg: "All the best for your interview.",
          lastMsgTime: "06:30 am",
        ),
        const ChatTile(
          name: "Flash",
          imgUrl: ImagesAsset.kaapiImg,
          lastMsg: "Help me save the world.",
          lastMsgTime: "08:30 am", 
        ),
      ],
    );
  }
}
