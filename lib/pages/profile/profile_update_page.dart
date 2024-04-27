import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaapi_club/widgets/common_btn.dart';

class ProfileUpdatePage extends StatelessWidget {
  const ProfileUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "update profile",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        leading: IconButton(
          onPressed: () {
            Get.offAllNamed("/profilePage");
          },
          icon: const Icon(
            CupertinoIcons.chevron_back,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.primary,
              ),
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              shape: BoxShape.circle),
                          child: const Center(
                            child: Icon(
                              CupertinoIcons.photo,
                              size: 50,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Your Bio",
                              style: Theme.of(context).textTheme.bodyLarge,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Text(
                              "Name",
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          controller: nameController,
                          cursorColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            hintText: "Sharath",
                            prefixIcon: Icon(
                              CupertinoIcons.person,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Text(
                              "Email",
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          controller: emailController,
                          cursorColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          decoration: const InputDecoration(
                            hintText: "sharath@gmail.com",
                            prefixIcon: Icon(
                              CupertinoIcons.mail,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Text(
                              "Mobile Number",
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          controller: emailController,
                          cursorColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          decoration: const InputDecoration(
                            hintText: "8976564321",
                            prefixIcon: Icon(
                              CupertinoIcons.mail,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        CommonBtn(
                          btnName: "save bio",
                          iconData: CupertinoIcons.doc_richtext,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
