import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final String name;
  final String imgUrl;
  final String lastMsg;
  final String lastMsgTime;
  const ChatTile({super.key, required this.name, required this.imgUrl, required this.lastMsg, required this.lastMsgTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.primary),
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
             Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child:  ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(imgUrl,fit: BoxFit.cover,)),
            ),
              const SizedBox(
                width: 15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(
                    height: 2.5,
                  ),
                  Text(
                    lastMsg,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ],
          ),
          Text(lastMsgTime, style: Theme.of(context).textTheme.labelMedium)
        ],
      ),
    );
  }
}
