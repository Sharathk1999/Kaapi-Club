import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaapi_club/controller/chat_controller.dart';
import 'package:kaapi_club/controller/contact_list_controller.dart';
import 'package:kaapi_club/core/images.dart';
import 'package:kaapi_club/pages/chat/chat_page.dart';
import 'package:kaapi_club/pages/contact/widgets/contect_search.dart';
import 'package:kaapi_club/pages/contact/widgets/new_contact_tile.dart';
import 'package:kaapi_club/pages/home/widgets/chat_tile.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isSearchEnabled = false.obs;
    ContactListController contactListController =
        Get.put(ContactListController());
    ChatController chatController = Get.put(ChatController());
    return Scaffold(
      appBar: AppBar(
        actions: [
          Obx(
            () => IconButton(
              onPressed: () {
                isSearchEnabled.value = !isSearchEnabled.value;
              },
              icon: Icon(
                isSearchEnabled.value
                    ? CupertinoIcons.xmark_circle
                    : CupertinoIcons.search,
              ),
            ),
          )
        ],
        leading: IconButton(
          onPressed: () {
            Get.offAllNamed("/homePage");
          },
          icon: const Icon(
            CupertinoIcons.chevron_back,
          ),
        ),
        title: Text(
          "Contacts",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Obx(
              () => isSearchEnabled.value
                  ? const ContactSearch()
                  : const SizedBox(),
            ),
            const SizedBox(
              height: 5.0,
            ),
            NewContactTile(
              iconData: CupertinoIcons.person_add,
              btnName: "New Contact",
              onTap: () {},
            ),
            const SizedBox(
              height: 15.0,
            ),
            NewContactTile(
              iconData: CupertinoIcons.group,
              btnName: "New Group",
              onTap: () {},
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Text(
                  "Your Contacts",
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Obx(
              () => Column(
                children: contactListController.userList
                    .map(
                      (user) => GestureDetector(
                        onTap: () {
                          Get.to(
                            ChatPage(
                              userModel: user,
                            ),
                          );
                        },
                        child: ChatTile(
                          name: user.name ?? "User Name",
                          imgUrl: user.profileImg ?? ImagesAsset.defaultProfImg,
                          lastMsg: user.bio ?? "Hi, buddy",
                          lastMsgTime: "",
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
