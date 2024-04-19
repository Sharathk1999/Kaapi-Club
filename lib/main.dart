import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaapi_club/core/page_paths.dart';
import 'package:kaapi_club/core/theme.dart';
import 'package:kaapi_club/pages/home/home_page.dart';
void main() {
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
      home: const HomePage(),
    );
  }
}

