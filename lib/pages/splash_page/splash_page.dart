import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kaapi_club/controller/splash_controller.dart';
import 'package:kaapi_club/core/images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    SplashController splashController= Get.put(SplashController());
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SvgPicture.asset(
            ImagesAsset.kaapiIcon,
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}
