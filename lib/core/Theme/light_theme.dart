import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: AppLightColor.backgroundColor,
  textTheme: TextTheme(
    titleMedium: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 20,
      letterSpacing: 0,
      color: AppLightColor.textTitileColor,
      fontFamily: "Times New Roman",
    ),

    displayMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      letterSpacing: 0,
      color: AppLightColor.textDescColor,
      fontFamily: "Times New Roman",
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 14,
      letterSpacing: 0,
      color: AppLightColor.primarytext,
      fontFamily: "Schibsted Grotesk",
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: EdgeInsets.zero,
      overlayColor: Colors.transparent,
      foregroundColor: AppLightColor.primaryColor,
      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      fixedSize: Size(double.infinity, 48),
      foregroundColor: AppLightColor.buttonText,
      backgroundColor: AppLightColor.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppLightColor.bottomNavBarBackground,
    selectedItemColor: AppLightColor.primaryColor,
    unselectedItemColor: AppLightColor.textsecondart,
    showUnselectedLabels: true,
  ),
  inputDecorationTheme: InputDecorationThemeData(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
  ),
);
