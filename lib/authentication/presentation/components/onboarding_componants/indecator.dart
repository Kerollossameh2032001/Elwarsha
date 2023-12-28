import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/constant/app_color_constant.dart';
import 'on_boarding_model.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: pageData.length,
      effect: WormEffect(
        activeDotColor: AppColorConstant.primaryColor,
        dotColor: AppColorConstant.secondaryColor,
        dotHeight: 10,
        dotWidth: 10,
      ),
      axisDirection: Axis.horizontal,
    );
  }
}