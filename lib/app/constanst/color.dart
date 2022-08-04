import 'package:flutter/material.dart';

const appPurple = Color(0xFF2E0D8A);
const appPurpleDark = Color(0xFF1E0771);
const appPurpleLight1 = Color(0xFF9345F2);
const appPurpleLight2 = Color(0xFFB9A2D8);
const appWhite = Color(0xFF9FAF8FC);

ThemeData appLight = ThemeData(
    primaryColor: appPurple,
    scaffoldBackgroundColor: appWhite,
    appBarTheme: AppBarTheme(backgroundColor: appPurpleDark),
     textTheme: TextTheme(
    bodyText1: TextStyle(
      color: appPurpleDark
    ),
    bodyText2: TextStyle(
      color: appPurpleDark
    )
  ));
    

ThemeData appDark = ThemeData(
  primaryColor: appPurple,
  scaffoldBackgroundColor: appPurpleDark,
  appBarTheme: AppBarTheme(backgroundColor: appPurpleDark),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: appWhite
    ),
    bodyText2: TextStyle(
      color: appWhite
    )
  )
);
