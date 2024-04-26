import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaapi_club/controller/auth_controller.dart';
import 'package:kaapi_club/widgets/common_btn.dart';

import '../../../core/colors.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    AuthController authController = Get.put(AuthController());

    return Column(
      children: [
        TextField(
          controller: nameController,
          cursorColor: darkContainerColor,
          decoration: const InputDecoration(
              hintText: "your name", prefixIcon: Icon(CupertinoIcons.mail)),
        ),
        const SizedBox(
          height: 25,
        ),
        TextField(
          controller: emailController,
          cursorColor: darkContainerColor,
          decoration: const InputDecoration(
              hintText: "your email", prefixIcon: Icon(CupertinoIcons.mail)),
        ),
        const SizedBox(
          height: 25,
        ),
        TextField(
          controller: passwordController,
          cursorColor: darkContainerColor,
          decoration: const InputDecoration(
              hintText: "your password",
              prefixIcon: Icon(CupertinoIcons.lock_circle)),
        ),
        const SizedBox(
          height: 50,
        ),
    Obx(() =>     authController.isLoading.value
            ?const  CircularProgressIndicator(
              color: Colors.white,
            )
            : CommonBtn(
                btnName: "Sign up",
                iconData: CupertinoIcons.pencil_ellipsis_rectangle,
                onTap: () {
                  authController.signUpUser(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  );
                },
              ),),
        const SizedBox(
          height: 25.0,
        ),
      ],
    );
  }
}
