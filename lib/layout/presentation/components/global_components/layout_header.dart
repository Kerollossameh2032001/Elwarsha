import 'package:elwarsha/core/constant/app_color_constant.dart';
import 'package:elwarsha/core/global/widgets/navigate_to.dart';
import 'package:elwarsha/layout/domain/entities/profile_entities/prfile_data.dart';
import 'package:elwarsha/layout/domain/entities/profile_entities/profile_entity.dart';
import 'package:elwarsha/layout/presentation/screens/notification_screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../notification/data/repos/repo_implement.dart';
import '../../../../notification/presentation/view_model/notification_data_cubit.dart';
import '../../screens/search_screen.dart';

class LayoutHeader extends StatelessWidget {
  final ProfileData profileData;
  final String token;
  const LayoutHeader({
    super.key, required this.profileData, required this.token,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationDataCubit(NotificationRepoImplement())
        ..fetchNotificationData(
          token: token,
        ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: 80.h,
            decoration: const BoxDecoration(
              gradient: AppColorConstant.primaryGradientColor,
            ),
          ),
          Positioned(
            top: 50,
            left: 10,
            child: Card(
              child: SizedBox(
                width: 250.w,
                height: 60.h,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Hi",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.white),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                profileData.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                    color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                          Text(
                            profileData.phone,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                color: AppColorConstant.titleMedColor,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 320,
            top: 50,
            child: Card(
              child: SizedBox(
                width: 55.w,
                height: 60.h,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Badge.count(count: 9),
                      IconButton(
                          onPressed: () {
                            navigateTo(context: context, destination: NotificationScreen(token: token,));
                          },
                          icon: const Icon(
                            Icons.notifications_none_outlined,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
