import 'package:elwarsha/core/constant/app_color_constant.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_size_constat.dart';

class TextStyles {
  static const buttonNavBarTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColorConstant.labelMedColor,
  );
  static const largeTitlesStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: AppSizeConstant.titleLargeSize,
    color: AppColorConstant.labelMedColor,
  );
  static const bodyMediumStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: AppSizeConstant.bodyMediumSize,
    color: AppColorConstant.labelMedColor,
  );
  static const bodySmallStyle = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: AppSizeConstant.bodyMediumSize,
    color: AppColorConstant.labelMedColor,
  );
}