import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaapi_club/core/page_routes.dart';
import 'package:kaapi_club/core/theme.dart';

import 'firebase_options.dart';
import 'pages/profile/profile_page.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kaapi Club',
      theme: lightTheme,
      getPages: pagePaths,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: const ProfilePage(),
    );
  }
}

