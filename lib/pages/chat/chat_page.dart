import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaapi_club/core/images.dart';
import 'package:kaapi_club/pages/chat/widgets/chat_bubble.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(ImagesAsset.kaapiImg),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sharath Kumar",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "online",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.videocam_fill,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.phone_fill,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).colorScheme.primary,
        ),
        padding: const EdgeInsets.all(5.0),
        margin: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.photo,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
            Expanded(
              child: TextField(
                cursorColor: Theme.of(context).colorScheme.primaryContainer,
                decoration:const InputDecoration(
                  filled: false,
                  hintText: "write your message...",
                ),
              ),
            ),
             IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.mic,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
             IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.chat_bubble,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: const [
            ChatBubble(
              message: "Hi I am coming to bangalore for searching job",
              isReceived: true,
              imageUrl: "",
              time: "08:23 am",
              status: "seen",
            ),
            ChatBubble(
              message: "I am coming to bangalore",
              isReceived: false,
              imageUrl: "",
              time: "08:23 am",
              status: "seen",
            ),
            ChatBubble(
              message: "bangalore",
              isReceived: false,
              imageUrl:
                  "https://img.onmanorama.com/content/dam/mm/en/travel/beyond-kerala/images/2019/2/18/bangalore.jpg",
              time: "08:23 am",
              status: "seen",
            ),
            ChatBubble(
              message: "I am coming",
              isReceived: true,
              imageUrl: "",
              time: "08:23 am",
              status: "seen",
            ),
            ChatBubble(
              message: "bangalore",
              isReceived: true,
              imageUrl:
                  "https://img.onmanorama.com/content/dam/mm/en/travel/beyond-kerala/images/2019/2/18/bangalore.jpg",
              time: "08:23 am",
              status: "seen",
            ),
          ],
        ),
      ),
    );
  }
}
