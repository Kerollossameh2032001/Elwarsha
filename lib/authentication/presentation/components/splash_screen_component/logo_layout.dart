import 'package:flutter/material.dart';

import '../../../../core/constant/app_path_constant.dart';

class LogoLayout extends StatelessWidget {
  const LogoLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.6,
      decoration: const BoxDecoration(image: DecorationImage(
        image: AssetImage(AppPathConstant.splashBackground),
        fit: BoxFit.cover
      )),
    );
  }
}
