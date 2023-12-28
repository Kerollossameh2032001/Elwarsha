import 'package:elwarsha/authentication/presentation/screens/login_screen.dart';
import 'package:elwarsha/core/constant/app_color_constant.dart';
import 'package:elwarsha/core/global/widgets/navigate_to.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/global/widgets/custom_button.dart';
import '../../../core/services/cache_helper.dart';
import '../components/onboarding_componants/build_page_item.dart';
import '../components/onboarding_componants/indecator.dart';
import '../components/onboarding_componants/on_boarding_model.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.5,
                top: MediaQuery.of(context).size.height * 0.02,
              ),
              child: TextButton(
                onPressed: () {
                  onSubmit(context);
                },
                child: Text(
                  'Skip',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                allowImplicitScrolling: true,
                scrollDirection: Axis.horizontal,
                itemCount: pageData.length,
                onPageChanged: (int index) {
                  if (index == pageData.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) => BuildPageItem(
                  model: pageData[index],
                ),
                controller: pageController,
                physics: const BouncingScrollPhysics(),
              ),
            ),
            Indicator(pageController: pageController),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.3,
                vertical: 10,
              ),
              child: CustomButton(
                color: AppColorConstant.primaryColor,
                onPressed: () {
                  if (isLast) {
                    onSubmit(context);
                  } else {
                    pageController.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  }
                },
                child: Text('Next',
                    style: Theme.of(context).textTheme.labelMedium),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onSubmit(context) {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateTo(context: context, destination: LoginScreen());
      }
    });
  }
}




