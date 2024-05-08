import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaapi_club/controller/profile_controller.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.primary,
      ),
      padding: const EdgeInsets.all(15.0),
      // height: 120,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.person,
                      size: 70,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Text(
                        profileController.currentUser.value.name ?? "User",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Text(
                        profileController.currentUser.value.email ?? "",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).colorScheme.background,
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Row(
                        children: [
                          Icon(
                            CupertinoIcons.phone,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text("Call"),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).colorScheme.background,
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Row(
                        children: [
                          Icon(
                            CupertinoIcons.videocam,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text("Video"),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).colorScheme.background,
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Row(
                        children: [
                          Icon(
                            CupertinoIcons.chat_bubble_2,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text("Chats"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
