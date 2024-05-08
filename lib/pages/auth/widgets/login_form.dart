import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaapi_club/controller/auth_controller.dart';
import 'package:kaapi_club/core/colors.dart';

import '../../../widgets/common_btn.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    AuthController authController = Get.put(AuthController());
    return Column(
      children: [
        TextField(
          controller: emailController,
          cursorColor: darkContainerColor,
          decoration: const InputDecoration(
            hintText: "your email",
            prefixIcon: Icon(
              CupertinoIcons.mail,
            ),
          ),
        ),
        const SizedBox(
          height: 25.0,
        ),
        TextField(
          controller: passwordController,
          cursorColor: darkContainerColor,
          decoration: const InputDecoration(
            hintText: "your password",
            prefixIcon: Icon(
              CupertinoIcons.lock_circle,
            ),
          ),
        ),
        const SizedBox(
          height: 50.0,
        ),
     Obx(() =>    authController.isLoading.value ? const CircularProgressIndicator(color: Colors.white,):CommonBtn(
          btnName: "Login",
          iconData: CupertinoIcons.lock_open,
          onTap: () {
            authController.login(
              emailController.text,
              passwordController.text,
              context,
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
