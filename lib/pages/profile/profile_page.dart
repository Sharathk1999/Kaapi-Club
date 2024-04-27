import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaapi_club/controller/auth_controller.dart';
import 'package:kaapi_club/pages/profile/widgets/profile_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController= Get.put(AuthController());
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
                authController.signOut();
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
