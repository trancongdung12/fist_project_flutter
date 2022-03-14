import 'package:DungxApp/themes/app_color.dart';
import 'package:flutter/material.dart';

final ThemeData LightThemeData = ThemeData(
  primaryColor: AppColors.primary,
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: AppColors.lightAccent),
  splashColor: AppColors.splash,
  highlightColor: AppColors.lightHighlight,
  backgroundColor: AppColors.lightBackgroundColor,
  scaffoldBackgroundColor: AppColors.lightScaffoldBackground,
  textTheme: const TextTheme(
    headline1: TextStyle(
      color: AppColors.lightStrongText,
      fontWeight: FontWeight.normal,
      fontSize: 20,
    ),
    headline2: TextStyle(
      color: AppColors.lightStrongText,
      fontWeight: FontWeight.normal,
      fontSize: 18,
    ),
    headline3: TextStyle(
      color: AppColors.lightStrongText,
      fontWeight: FontWeight.normal,
      fontSize: 16,
    ),
    headline4: TextStyle(
      color: AppColors.lightStrongText,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
    headline5: TextStyle(
      color: AppColors.lightStrongText,
      fontWeight: FontWeight.normal,
      fontSize: 12,
    ),
    headline6: TextStyle(
      color: AppColors.lightNormalText,
      fontSize: 10,
    ),
    bodyText1: TextStyle(
      color: AppColors.lightStrongText,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    bodyText2: TextStyle(
      color: AppColors.lightStrongText,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
    subtitle1: TextStyle(
      color: AppColors.lightNormalText,
      fontSize: 12,
    ),
  ),
);
