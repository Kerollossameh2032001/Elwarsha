import 'package:flutter/material.dart';

import '../../constant/app_color_constant.dart';
import '../../constant/app_size_constat.dart';
import '../../constant/app_string_constants.dart';

ThemeData getDarkThemeData() => ThemeData(
  scaffoldBackgroundColor: AppColorConstant.backgroundColor,
  primaryColor: AppColorConstant.primaryColor,
  primaryColorDark: AppColorConstant.secondaryColor,
  focusColor: Colors.grey,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: AppStringConstant.cairoFont,
      fontWeight: FontWeight.bold,
      fontSize: AppSizeConstant.titleLargeSize,
      color: AppColorConstant.primaryColor,
    ),
    titleMedium: TextStyle(
      fontFamily: AppStringConstant.cairoFont,
      color: AppColorConstant.titleMedColor,
      fontSize: AppSizeConstant.titleMediumSize,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
        fontFamily: AppStringConstant.cairoFont,
        color: AppColorConstant.bodyLargeColor,
        fontSize: AppSizeConstant.bodySmallSize,
        fontWeight: FontWeight.bold),
    bodySmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontStyle: FontStyle.italic
    ),
    labelMedium: TextStyle(
      fontFamily: AppStringConstant.cairoFont,
      color: AppColorConstant.labelMedColor,
      fontSize: AppSizeConstant.labelMedSize,
      fontWeight: FontWeight.bold,
    ),
  ),
  cardTheme: CardTheme(
    color: AppColorConstant.backgroundColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(
            color: Colors.black,
            width: 1
        )
    ),
    elevation: 3,

  )
  // appBarTheme: AppBarTheme(
  //   backgroundColor: Colors.grey[400],
  //   systemOverlayStyle: SystemUiOverlayStyle(
  //     statusBarColor: Colors.grey[400],
  //   )
  // ),
  /*inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(vertical: 10),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColorConstant.signInColor),
        borderRadius: BorderRadius.circular(AppSizeConstant.borderRadius),
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizeConstant.borderRadius),
          borderSide: BorderSide(color: AppColorConstant.signInColor)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizeConstant.borderRadius),
          borderSide: BorderSide(color: AppColorConstant.signInColor)),
    )*/

);