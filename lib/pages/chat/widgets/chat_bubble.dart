import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isReceived;
  final String imageUrl;
  final String time;
  final String status;

  const ChatBubble(
      {super.key,
      required this.message,
      required this.isReceived,
      required this.imageUrl,
      required this.time,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:10.0),
      child: Column(
        crossAxisAlignment:
            isReceived ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
            constraints:
                BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width / 1.4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(12),
                topRight: const Radius.circular(12),
                bottomLeft: isReceived
                    ? const Radius.circular(0)
                    : const Radius.circular(12),
                bottomRight: isReceived
                    ? const Radius.circular(12)
                    : const Radius.circular(0),
              ),
              color: isReceived
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.primary.withOpacity(
                        0.5,
                      ),
            ),
            padding: const EdgeInsets.all(12.0),
            child: imageUrl=="" ?  Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
            ):Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(imageUrl)),
                   const SizedBox(
            height: 5.0,
          ),
                 Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
            )
              ],
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment:
                isReceived ? MainAxisAlignment.start : MainAxisAlignment.end,
            children: [
              isReceived
                  ? Text(time,style: Theme.of(context).textTheme.labelMedium,)
                  : Row(
                      children: [
                        Text(time,style: Theme.of(context).textTheme.labelMedium,),
                        const SizedBox(
                          width: 2.0,
                        ),
                        const Icon(
                          CupertinoIcons.checkmark_alt_circle_fill,
                          color: Colors.green,
                          size: 15,
                        )
                      ],
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
