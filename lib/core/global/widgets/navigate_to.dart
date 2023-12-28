import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*Future<dynamic>*/ void  navigateToAndReplacement({
  required BuildContext context,
  required Widget destination,
}) {
  Navigator.pushAndRemoveUntil(
    context,
    CupertinoPageRoute(
      builder: (context) => destination,
    ), (route) => false, // Remove all previous routes
  );
  // return Navigator.of(context).pushAndRemoveUntil(
  //   PageRouteBuilder(
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       return SharedAxisTransition(
  //         transitionType: SharedAxisTransitionType.horizontal,
  //         secondaryAnimation: secondaryAnimation,
  //         animation: animation,
  //         child: child,
  //       );
  //     },
  //     barrierColor: Colors.black,
  //     transitionDuration: const Duration(seconds: 2),
  //     pageBuilder: (context, animation, secondaryAnimation) {
  //       return destination;
  //     },
  //   ),
  // );
}

Future<dynamic> navigateTo({
  required BuildContext context,
  required Widget destination,
}) {
  return Navigator.of(context).push(
    PageRouteBuilder(
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SharedAxisTransition(
          transitionType: SharedAxisTransitionType.horizontal,
          secondaryAnimation: secondaryAnimation,
          animation: animation,
          child: child,
        );
      },
      transitionDuration: const Duration(seconds: 2),
      barrierColor: Colors.black,
      pageBuilder: (context, animation, secondaryAnimation) {
        return destination;
      },
    ),
  );
}

Future<dynamic> navigateAndReplacement({
  required BuildContext context,
  required Widget destination,
}) {
  return Navigator.of(context).pushReplacement(
    PageRouteBuilder(
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SharedAxisTransition(
          transitionType: SharedAxisTransitionType.horizontal,
          secondaryAnimation: secondaryAnimation,
          animation: animation,
          child: child,
        );
      },
      transitionDuration: const Duration(seconds: 2),
      barrierColor: Colors.black,
      pageBuilder: (context, animation, secondaryAnimation) {
        return destination;
      },
    ),
  );
}
