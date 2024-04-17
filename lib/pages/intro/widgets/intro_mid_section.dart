import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaapi_club/core/colors.dart';

import '../../../core/app_strings.dart';
import '../../../core/images.dart';

class IntroMidSection extends StatelessWidget {
  const IntroMidSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset(
                    ImagesAsset.chatIcon,
                    height: 60,
                    width: 60,
                    color: darkOnBgColor,
                  ),
                 const Icon(CupertinoIcons.link,size: 40,),
                  SvgPicture.asset(
                    ImagesAsset.conversationIcon,
                    height: 40,
                    width: 40,
                    color: darkOnBgColor,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                IntroPageStrings.introPageTitle,
                style: TextStyle(
                  fontFamily: "Raleway",
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                IntroPageStrings.description,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
      ],
    );
  }
}