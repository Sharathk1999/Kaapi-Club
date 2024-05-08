import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaapi_club/controller/auth_controller.dart';
import 'package:kaapi_club/controller/image_picker_controller.dart';
import 'package:kaapi_club/controller/profile_controller.dart';
import 'package:kaapi_club/widgets/common_btn.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isEditable = false.obs;
    ProfileController profileController = Get.put(ProfileController());
    ImagePickerController imageController = Get.put(ImagePickerController());
    AuthController authController = Get.put(AuthController());
    RxString imgPath = "".obs;

    return FutureBuilder(
      future: profileController.getUserInfo(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
          );
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        TextEditingController name = TextEditingController(
            text: profileController.currentUser.value.name);
        TextEditingController email = TextEditingController(
            text: profileController.currentUser.value.email);
        TextEditingController mobile = TextEditingController(
            text: profileController.currentUser.value.mobileNumber);
        TextEditingController bio = TextEditingController(
            text: profileController.currentUser.value.bio);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Profile",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  authController.signOut();
                },
                icon: const Icon(
                  Icons.logout_rounded,
                ),
              ),
            ],
            leading: IconButton(
              onPressed: () {
                Get.offAllNamed("/homePage");
              },
              icon: const Icon(
                CupertinoIcons.chevron_back,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
                Container(
                  // height: 300,
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
                            Obx(
                              () => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  isEditable.value
                                      ? Stack(
                                          children: [
                                            Container(
                                              width: 150,
                                              height: 150,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .background,
                                              ),
                                              child: imgPath.value == ""
                                                  ? const Icon(
                                                      CupertinoIcons.photo)
                                                  : ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      child: Image.file(
                                                        File(
                                                          imgPath.value,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                            ),
                                            Positioned(
                                              bottom: 10,
                                              right: 1,
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primaryContainer,
                                                ),
                                                child: Center(
                                                  child: IconButton(
                                                    onPressed: () async {
                                                      imgPath.value =
                                                          await imageController
                                                              .pickImage();
                                                    },
                                                    icon: Icon(
                                                      CupertinoIcons.add,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Container(
                                          width: 150,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background,
                                          ),
                                          child: profileController.currentUser
                                                      .value.profileImg ==
                                                  "" || profileController.currentUser
                                                      .value.profileImg == null
                                              ? const Icon(CupertinoIcons.photo)
                                              : ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  child: Image.network(
                                                    profileController
                                                        .currentUser
                                                        .value
                                                        .profileImg!,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                        ),
                                ],
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
                            Obx(
                              () => TextField(
                                controller: name,
                                cursorColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                enabled: isEditable.value,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  filled: isEditable.value,
                                  labelText: "Name",
                                  labelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer),
                                  prefixIcon: const Icon(
                                    CupertinoIcons.person,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Obx(
                              () => TextField(
                                controller: bio,
                                cursorColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                enabled: isEditable.value,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  filled: isEditable.value,
                                  labelText: "Bio",
                                  labelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer),
                                  prefixIcon: const Icon(
                                    CupertinoIcons.doc_richtext,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            TextField(
                              controller: email,
                              cursorColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              enabled: false,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                filled: isEditable.value,
                                labelText: "Email",
                                labelStyle: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer),
                                prefixIcon: const Icon(
                                  CupertinoIcons.mail,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Obx(
                              () => TextField(
                                controller: mobile,
                                cursorColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                enabled: isEditable.value,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  filled: isEditable.value,
                                  labelText: "Mobile no",
                                  labelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer),
                                  prefixIcon: const Icon(
                                    CupertinoIcons.phone,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Obx(
                              () => isEditable.value
                                  ? CommonBtn(
                                      btnName: "Save",
                                      iconData: CupertinoIcons.doc,
                                      onTap: () async {
                                        await profileController.updateProfile(
                                          name.text.trim(),
                                          imgPath.value,
                                          bio.text.trim(),
                                          mobile.text.trim(),
                                        );
                                        isEditable.value = false;
                                      },
                                    )
                                  : CommonBtn(
                                      btnName: "Edit",
                                      iconData: CupertinoIcons.pen,
                                      onTap: () {
                                        isEditable.value = true;
                                      },
                                    ),
                            ),
                            const SizedBox(
                              height: 20.0,
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
      },
    );
  }
}
