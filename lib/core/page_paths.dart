import 'package:get/get.dart';
import 'package:kaapi_club/pages/auth/auth_page.dart';
import 'package:kaapi_club/pages/chat/chat_page.dart';
import 'package:kaapi_club/pages/home/home_page.dart';

import '../pages/profile/profile_page.dart';

var pagePaths = [
  GetPage(
    name: "/authPage",
    page: () => const AuthPage(),
    transition: Transition.native,
  ),
  GetPage(
    name: "/homePage",
    page: () => const HomePage(),
    transition: Transition.native,
  ),
  GetPage(
    name: "/chatPage",
    page: () => const ChatPage (),
    transition: Transition.native,
  ),
  GetPage(
    name: "/profilePage",
    page: () => const ProfilePage(),
    transition: Transition.native,
  ),
  GetPage(
    name: "/profileUpdatePage",
    page: () => const ChatPage (),
    transition: Transition.native,
  ),
];
