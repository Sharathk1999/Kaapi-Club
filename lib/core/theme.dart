import 'package:flutter/material.dart';
import 'package:kaapi_club/core/colors.dart';

var darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  inputDecorationTheme: InputDecorationTheme(
    border: UnderlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(12),
    ),
    fillColor: darkBgColor,
    filled: true,
  ),
  colorScheme: const ColorScheme.dark(
    primary: darkPrimaryColor,
    onPrimary: darkOnBgColor,
    background: darkBgColor,
    onBackground: darkOnContainerColor,
    primaryContainer: darkContainerColor,
    onPrimaryContainer: darkOnContainerColor,
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontFamily: "Raleway",
      fontSize: 30,
      color: darkPrimaryColor,
      fontWeight: FontWeight.w800,
    ),
    headlineMedium: TextStyle(
      fontFamily: "Raleway",
      fontSize: 28,
      color: darkPrimaryColor,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      fontFamily: "Raleway",
      fontSize: 22,
      color: darkPrimaryColor,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontFamily: "Raleway",
      fontSize: 18,
      color: darkOnContainerColor,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Raleway",
      fontSize: 15,
      color: darkOnContainerColor,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      fontFamily: "Raleway",
      fontSize: 12,
      color: darkOnContainerColor,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      fontFamily: "Raleway",
      fontSize: 15,
      color: darkOnContainerColor,
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
      fontFamily: "Raleway",
      fontSize: 12,
      color: darkOnContainerColor,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      fontFamily: "Raleway",
      fontSize: 10,
      color: darkOnContainerColor,
      fontWeight: FontWeight.w300,
    ),
  ),
);
var lightTheme = ThemeData();
