import 'package:elwarsha/core/constant/app_color_constant.dart';
import 'package:elwarsha/core/notification/push_notification_service.dart';
import 'package:elwarsha/core/services/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/services/service_locator.dart';
import '../components/styles/text_styles.dart';
import '../controller/layout_cubit/layout_cubit.dart';
import '../controller/layout_cubit/layout_state.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String token = CacheHelper.getDate(key: 'token');
    print(token);
    PushNotificationService.init(context);
    return BlocProvider (
      create: (context) => sl<LayoutCubit>()
        ..getProducts(token: token)
        ..getSliders(token: token)
        ..getProfileData(token: token)
        ..getUserCurrentLocation()
        ..getOrderHistory(token: token)
        ..checkSubscription(token: token)
        ..getAuthToken(),
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {
          // if(state is GetProfileSuccessState){
          //   print("Get Profile data....!");
          //   print(state.userData.data.phone);
          // }
        },
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              selectedLabelStyle: TextStyles.buttonNavBarTextStyle,
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(CupertinoIcons.home),
                  activeIcon: Icon(
                    CupertinoIcons.home,
                    color: AppColorConstant.buttonNavBarIconColor,
                  ),
                  label: 'Home',
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.grid_view_rounded),
                  label: 'Categories',
                  activeIcon: Icon(
                    Icons.grid_view_rounded,
                    color: AppColorConstant.buttonNavBarIconColor,
                  ),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.miscellaneous_services_outlined,
                    color: AppColorConstant.buttonNavBarIconColor,
                  ),
                  icon: const Icon(Icons.miscellaneous_services_outlined),
                  label: 'Orders',
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    FontAwesomeIcons.bars,
                    color: AppColorConstant.buttonNavBarIconColor,
                  ),
                  icon: const Icon(FontAwesomeIcons.bars),
                  label: 'More',
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                ),
              ],
              backgroundColor: Colors.white,
              currentIndex: LayoutCubit.get(context).currentIndex,
              onTap: (index) {
                LayoutCubit.get(context).changeBottomIndex(index: index);
              },
            ),
            body: LayoutCubit.get(context)
                .screens[LayoutCubit.get(context).currentIndex],
          );
        },
      ),
    );
  }
}
