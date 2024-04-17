import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/common_btn.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "your email",
            prefixIcon: Icon(CupertinoIcons.mail)
          ),
        ),  
        SizedBox(height: 20,),
        TextField(
          decoration: InputDecoration(
            hintText: "your password",
            prefixIcon: Icon(CupertinoIcons.lock_circle)
          ),
        ),
             SizedBox(height: 20,),
        CommonBtn(btnName: "Login", iconData: CupertinoIcons.lock_open)
      ],
    );
  }
}