import 'package:flutter/material.dart';
import 'package:kaapi_club/pages/auth/widgets/auth_container.dart';
import 'package:kaapi_club/pages/intro/widgets/intro_title_widget.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(
            12.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                IntroTitle(),
                SizedBox(
                  height: 15,
                ),
               AuthContainer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
