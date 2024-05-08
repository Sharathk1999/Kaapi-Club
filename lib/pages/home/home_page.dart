import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaapi_club/core/app_strings.dart';
import 'package:kaapi_club/core/colors.dart';
import 'package:kaapi_club/core/images.dart';
import 'package:kaapi_club/pages/home/widgets/chat_list_tile.dart';
import 'package:kaapi_club/pages/home/widgets/home_tabbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          AppStrings.appTitle,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: darkContainerColor),
        ),
        
        actions: [
          IconButton(
            onPressed: () {
             
            },
            icon: const Icon(
              CupertinoIcons.search,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.offAllNamed("/profilePage");
            },
            icon: const Icon(
              CupertinoIcons.settings,
            ),
          ),
        ],
        leading: const CircleAvatar(
          backgroundImage: AssetImage(ImagesAsset.kaapiImg),
        ),
        bottom: homeTabBar(tabController, context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          CupertinoIcons.create,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TabBarView(
          controller: tabController,
          children: [
          const ChatListTile(),
            ListView(
              children: const [
                ListTile(
                  title: Text("Sharath"),
                )
              ],
            ),
            ListView(
              children: const [
                ListTile(
                  title: Text("Sharath"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
