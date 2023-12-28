import 'package:bloc/bloc.dart';
import 'package:elwarsha/authentication/presentation/screens/start_splash_screen.dart';
import 'package:elwarsha/core/constant/app_constant_key.dart';
import 'package:elwarsha/core/global/theme/dark_theme.dart';
import 'package:elwarsha/payment/core/network/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/constant/app_string_constants.dart';
import 'core/services/bloc_observer.dart';
import 'core/services/cache_helper.dart';
import 'core/services/dio_helper.dart';
import 'core/services/service_locator.dart';
import 'firebase_options.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();
//
//   print("Handling a background message: ${message.messageId}");
//   showFlutterToast(message: 'background message', state: ToastState.success);
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  DioHelperPayment.init();
  ServiceLocator.init();
  await CacheHelper.init();
  print('token => ');
  print(CacheHelper.getDate(
    key: AppConstantKey.getToken,
  ));
  Bloc.observer = MyBlocObserver();
  // FirebaseMessaging messaging = FirebaseMessaging.instance;
  // String? deviceToken = await messaging.getToken();
  // print("device_token: ${deviceToken}");
  //CacheHelper.saveData(key: AppConstantKey.getTokenDevice, value: deviceToken);
  // NotificationSettings settings = await messaging.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );
  //
  // ///TODO: Handle on Message.listen
  //
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   print('Got a message whilst in the foreground!');
  //   print('Message data: ${message.data}');
  //
  //   if (message.notification != null) {
  //     print('Message also contained a notification: ${message.notification}');
  //   }
  //   showFlutterToast(message: 'onMessage listen', state: ToastState.success);
  // });
  //
  // FirebaseMessaging.onMessageOpenedApp.listen((event) {
  //   showFlutterToast(message: 'onMessageOpenedApp', state: ToastState.success);
  //   //navigateTo(context: context, destination: OrdersScreen());
  // });
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getDarkThemeData(),
        title: AppStringConstant.appTitle,
        home: const SplashScreen(),
      ),
    );
  }
}