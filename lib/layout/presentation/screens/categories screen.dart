import 'package:elwarsha/car_wash/presetation/screens/car_wash_order_screen.dart';
import 'package:elwarsha/core/global/widgets/navigate_to.dart';
import 'package:elwarsha/core/services/cache_helper.dart';
import 'package:elwarsha/fuel/presentation/screens/fuel_order_screen.dart';
import 'package:elwarsha/layout/presentation/controller/layout_cubit/layout_cubit.dart';
import 'package:elwarsha/layout/presentation/controller/layout_cubit/layout_state.dart';
import 'package:elwarsha/repair/presentation/screens/repair_order_screen.dart';
import 'package:elwarsha/subscription/presentation/screens/make_subscription_sceen.dart';
import 'package:elwarsha/winch/presentation/screens/winch_service_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/global/widgets/show_flutter_toast.dart';
import '../components/category_components/category_item.dart';
import '../components/global_components/layout_header.dart';

class CategoriesScreen extends StatelessWidget {
   const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LayoutCubit.get(context).checkSubscription(token: CacheHelper.getDate(key: 'token'));
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {
        if (state is CheckSubscriptionErrorState) {

        }
      },
      builder: (context, state) {
        LayoutCubit cubit = LayoutCubit.get(context);

        if (cubit.currentUserData != null) {
          return Column(
            children: [
              LayoutHeader(profileData: cubit.currentUserData!,token: CacheHelper.getDate(key: 'token'),),
              SizedBox(
                height: MediaQuery.of(context).size.height * .2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CategoryItem(
                      categoryTitle: 'Fuel',
                      image: 'assets/images/fuel pump.png',
                      onTap: () {
                        cubit.checkSubscription(token: CacheHelper.getDate(key: 'token'));
                          cubit.isSubscribed
                              ? navigateTo(
                                  context: context,
                                  destination: FuelOrderScreen())
                              : navigateTo(
                                  context: context,
                                  destination: MakeSubscriptionScreen(userPhone: cubit.currentUserData!.phone,));

                      }),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .1,
                  ),
                  CategoryItem(
                      categoryTitle: 'Repair',
                      image: 'assets/images/car repair.png',
                      onTap: () {
                        cubit.checkSubscription(
                            token: CacheHelper.getDate(key: 'token'));
                        if (state is CheckSubscriptionSuccessState) {
                          navigateTo(
                              context: context,
                              destination: RepairOrderScreen());
                        }
                        if (state is CheckSubscriptionErrorState) {
                          navigateTo(
                              context: context,
                              destination: MakeSubscriptionScreen(userPhone: cubit.currentUserData!.phone,));
                        }
                      }),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CategoryItem(
                    categoryTitle: 'Car Wash',
                    image: 'assets/images/car wash.png',
                    onTap: () {
                      cubit.checkSubscription(
                          token: CacheHelper.getDate(key: 'token'));
                      if (state is CheckSubscriptionSuccessState) {
                        navigateTo(
                            context: context,
                            destination: CarWashOrderScreen());
                      }
                      if (state is CheckSubscriptionErrorState) {
                        navigateTo(
                            context: context,
                            destination: MakeSubscriptionScreen(userPhone: cubit.currentUserData!.phone,));
                      }
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .1,
                  ),
                  CategoryItem(
                      categoryTitle: 'Winch',
                      image: 'assets/images/winsh.png',
                      onTap: () {
                        cubit.checkSubscription(
                            token: CacheHelper.getDate(key: 'token'));
                        if (state is CheckSubscriptionSuccessState) {
                          navigateTo(
                              context: context,
                              destination: const WinchServiceScreen());
                        }
                        if (state is CheckSubscriptionErrorState) {
                          navigateTo(
                              context: context,
                              destination: MakeSubscriptionScreen(userPhone: cubit.currentUserData!.phone,));
                        }
                      }),
                ],
              )
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        }
      },
    );
  }
}
