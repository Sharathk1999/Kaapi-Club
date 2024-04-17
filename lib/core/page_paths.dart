import 'package:get/get.dart';
import 'package:kaapi_club/pages/auth/auth_page.dart';

var pagePaths = [
  GetPage(
    name: "/authPage",
    page: () => const AuthPage(),
    transition: Transition.native,
  ),
];
