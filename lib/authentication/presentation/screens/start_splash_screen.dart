import 'dart:async';

import 'package:elwarsha/core/constant/app_constant_key.dart';
import 'package:elwarsha/core/constant/app_string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

import '../../../core/global/widgets/get_city_name.dart';
import '../../../core/global/widgets/navigate_to.dart';
import '../../../core/services/cache_helper.dart';
import '../../../layout/presentation/screens/layout_screen.dart';
import '../components/splash_screen_component/logo_layout.dart';
import 'onboarding_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String locationMessage = 'Current Location of the user';
  late double lat;
  late double long;
  late Position? position;

  Future<Position> getUserLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw PlatformException(
            code: 'PERMISSION_DENIED',
            message: 'Location permission denied',
          );
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw PlatformException(
          code: 'PERMISSION_DENIED_FOREVER',
          message: 'Location permission denied forever',
        );
      }

      final Position position = await Geolocator.getCurrentPosition();
      print(position);
      return position;
    } catch (e) {
      throw PlatformException(
        code: 'ERROR_GETTING_LOCATION',
        message: 'Error getting user location: $e',
      );
    }
  }

  @override
  void initState() {
    getUserLocation().then((Position position) async{
      // Use the retrieved position as needed
      print('User location: ${position.latitude}, ${position.longitude}');
      String? city = await getCityName(latitude: position.latitude, longitude: position.longitude);
      print('User City: $city');
      CacheHelper.saveData(
          key: AppConstantKey.latitude, value: position.latitude);
      CacheHelper.saveData(
          key: AppConstantKey.longitude, value: position.longitude);
      CacheHelper.saveData(
          key: AppConstantKey.getCityName,
          value: city,
      );
      // Proceed with the app's logic or navigate to the next screen
      Timer(
          const Duration(seconds: 4),
              () => CacheHelper.getDate(key: 'token') == null
              ? navigateToAndReplacement(
              context: context, destination: OnBoardingScreen())
              : navigateToAndReplacement(
              context: context, destination: LayoutScreen()));
    }).catchError((error) {
      // Handle location retrieval errors
      print('Error getting user location: $error');
      // Proceed with the app's logic or display an error message
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LogoLayout(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppStringConstant.appTitle,
                      style: Theme.of(context).textTheme.titleLarge),
                  Text(
                    'Be safe with us',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    height: 90,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
* Timer(
        const Duration(seconds: 3),
            () => CacheHelper.getDate(key: 'token') == null
            ? navigateToAndReplacement(context: context, destination: OnBoardingScreen())
            : navigateToAndReplacement(context: context, destination: LayoutScreen()));
* */
