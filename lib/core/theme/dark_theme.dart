import 'package:DungxApp/themes/app_color.dart';
import 'package:flutter/material.dart';

final ThemeData DarkThemeData = ThemeData(
  primaryColor: AppColors.primary,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.darkAccent,
  ),
  splashColor: AppColors.splash,
  highlightColor: AppColors.darkHighlight,
  backgroundColor: AppColors.darkBackgroundColor,
  scaffoldBackgroundColor: AppColors.darkScaffoldBackground,
  textTheme: const TextTheme(
    headline1: TextStyle(
      color: AppColors.darkStrongText,
      fontWeight: FontWeight.normal,
      fontSize: 20,
    ),
    headline2: TextStyle(
      color: AppColors.darkStrongText,
      fontWeight: FontWeight.normal,
      fontSize: 18,
    ),
    headline3: TextStyle(
      color: AppColors.darkStrongText,
      fontWeight: FontWeight.normal,
      fontSize: 16,
    ),
    headline4: TextStyle(
      color: AppColors.darkStrongText,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
    headline5: TextStyle(
      color: AppColors.darkStrongText,
      fontWeight: FontWeight.normal,
      fontSize: 12,
    ),
    headline6: TextStyle(
      color: AppColors.darkNormalText,
      fontSize: 10,
    ),
    bodyText1: TextStyle(
      color: AppColors.darkStrongText,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    bodyText2: TextStyle(
      color: AppColors.darkStrongText,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
    subtitle1: TextStyle(
      color: AppColors.darkNormalText,
      fontSize: 12,
    ),
  ),
);
