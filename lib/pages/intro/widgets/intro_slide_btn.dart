import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../../../core/app_strings.dart';
import '../../../core/colors.dart';
import '../../../core/images.dart';

class IntroSlideBtn extends StatelessWidget {
  const IntroSlideBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideAction(
                text: IntroPageStrings.swipeToBegin,
                textColor: darkBgColor,
                textStyle: const TextStyle(
                   fontFamily: "Raleway",
                  color: darkBgColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
                innerColor: Theme.of(context).colorScheme.primary,
                outerColor: Theme.of(context).colorScheme.primaryContainer,
                sliderRotate: false,
                sliderButtonIcon: SvgPicture.asset(
                  ImagesAsset.chatIcon,
                  height: 28,
                  width: 28,
                  color: darkOnBgColor,
                ),
                submittedIcon: const Icon(CupertinoIcons.check_mark,color: darkBgColor,),
                onSubmit: () {
                 return Get.offAllNamed("/authPage");
                },
              );
  }
}