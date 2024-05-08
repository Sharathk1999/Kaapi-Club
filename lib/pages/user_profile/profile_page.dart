import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaapi_club/pages/user_profile/widgets/profile_card.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    
  
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.offAllNamed("/profileUpdatePage");
            },
            icon: const Icon(
              CupertinoIcons.pencil_ellipsis_rectangle,
            ),
          ),
        ],
        leading: IconButton(onPressed: (){
          Get.offAllNamed("/homePage");
        }, icon: const Icon(CupertinoIcons.chevron_back,),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const ProfileCard(),
            const Spacer(),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.primary,),
              ),
              onPressed: () {
                
              },
              child: Text(
                "Sign out",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
