import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app_strings.dart';
import '../../../core/images.dart';

class IntroTitle extends StatelessWidget {
  const IntroTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: SvgPicture.asset(
                      width: 120,
                      height: 120,
                      ImagesAsset.kaapiIcon,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5,),
              const Text(
                AppStrings.appTitle,
                style: TextStyle(
                  fontFamily: "Raleway",
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),

      ],
    );
  }
}