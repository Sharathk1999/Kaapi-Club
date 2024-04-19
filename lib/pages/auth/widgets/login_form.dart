import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaapi_club/core/colors.dart';

import '../../../widgets/common_btn.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextField(
          cursorColor: darkContainerColor,
          decoration: InputDecoration(
              hintText: "your email", prefixIcon: Icon(CupertinoIcons.mail)),
        ),
        const SizedBox(
          height: 25.0,
        ),
        const TextField(
          cursorColor: darkContainerColor,
          decoration: InputDecoration(
              hintText: "your password",
              prefixIcon: Icon(CupertinoIcons.lock_circle)),
        ),
        const SizedBox(
          height: 50.0,
        ),
        CommonBtn(
          btnName: "Login",
          iconData: CupertinoIcons.lock_open,
          onTap: () {},
        ),
        const SizedBox(
          height: 25.0,
        ),
      ],
    );
  }
}
