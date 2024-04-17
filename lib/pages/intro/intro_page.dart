import 'package:flutter/material.dart';
import 'package:kaapi_club/pages/intro/widgets/intro_mid_section.dart';
import 'package:kaapi_club/pages/intro/widgets/intro_title_widget.dart';

import 'widgets/intro_slide_btn.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 15,
              ),
              IntroTitle(),
              SizedBox(
                height: 60,
              ),
              IntroMidSection(),
              SizedBox(
                height: 80,
              ),
              IntroSlideBtn()
            ],
          ),
        ),
      ),
    );
  }
}
