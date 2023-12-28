import 'package:flutter/material.dart';

class AppColorConstant {
  static const Color primaryColor = Color.fromRGBO(236, 0, 0, 1);
  static Color secondaryColor = Colors.grey;
  static Color buttonNavBarIconColor = Colors.red;
  static Color? backgroundColor = Colors.grey[900];

  static const LinearGradient primaryGradientColor = LinearGradient(
    colors: [
      Color.fromRGBO(150, 1, 1, 1),
      Color.fromRGBO(100, 1, 1, 1),
      Color.fromRGBO(29, 1, 0, 1),
      Color.fromRGBO(29, 1, 0, 1),
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

//Text Themes
  static const titleLargeColor = Colors.grey;
  static const titleMedColor = Colors.white;
  static const labelMedColor = Colors.white;
  static const textBodyColor = Colors.white;
  static const bodyLargeColor = Colors.grey;



/*
class AppColorConstant{
  static Color containerColor = Colors.white.withOpacity(0.4);
  static Color borderColor = Colors.white;


  ///Light Color
   static const titleMedLightColor = Colors.white;
   static const bodyMedLightColor = Colors.black;
   static const loginHintTextColor = Colors.black;
   static const loginBorderColor = Colors.black;
   static const loginCursorColor = Colors.black;
   static const otpCodeBorderColor = Colors.black;
   static const otpCodeCursorColor = Colors.black;

  ///Dark Color
}*/
}