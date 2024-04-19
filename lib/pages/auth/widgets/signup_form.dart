import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaapi_club/widgets/common_btn.dart';

import '../../../core/colors.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const TextField(
          cursorColor: darkContainerColor,
          decoration: InputDecoration(
              hintText: "your name", prefixIcon: Icon(CupertinoIcons.mail)),
        ),
        const SizedBox(
          height: 25,
        ),
        const TextField(
          cursorColor: darkContainerColor,
          decoration: InputDecoration(
              hintText: "your email", prefixIcon: Icon(CupertinoIcons.mail)),
        ),
        const SizedBox(
          height: 25,
        ),
        const TextField(
          cursorColor: darkContainerColor,
          decoration: InputDecoration(
              hintText: "your password",
              prefixIcon: Icon(CupertinoIcons.lock_circle)),
        ),
        const SizedBox(
          height: 50,
        ),
        CommonBtn(
          btnName: "Sign up",
          iconData: CupertinoIcons.pencil_ellipsis_rectangle,
          onTap: () {
            Get.offAllNamed("/homePage");
          },
        ),
        const SizedBox(
          height: 25.0,
        ),
      ],
    );
  }
}
