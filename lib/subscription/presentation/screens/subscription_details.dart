import 'package:elwarsha/core/constant/app_color_constant.dart';
import 'package:elwarsha/core/global/widgets/show_flutter_toast.dart';
import 'package:elwarsha/subscription/presentation/controller/subscription_cubit/subscription_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/global/widgets/custom_dialog.dart';
import '../../../core/global/widgets/date_time_formate.dart';
import '../../../core/services/cache_helper.dart';
import '../../../core/services/service_locator.dart';
import '../../../layout/presentation/components/styles/text_styles.dart';
import '../../domain/entities/subscribtion_data_entitiy.dart';
import '../controller/subscription_cubit/subscription_state.dart';

class SubscriptionDetailsScreen extends StatelessWidget {
  SubscriptionDetailsScreen({Key? key}) : super(key: key);

  var list = [];

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => sl<SubscriptionCubit>()
        ..getAllUserSubscription(token: CacheHelper.getDate(key: 'token')),
      child: BlocConsumer<SubscriptionCubit, SubscriptionStates>(
        listener: (context, state) {
          if (state is GetAllUserSubscriptionLoadingState) {
            customDialog(context: context);
          } else if (state is GetAllUserSubscriptionErrorState) {
            showFlutterToast(
                message: state.errorMessage, state: ToastState.error);
          } else if (state is GetAllUserSubscriptionSuccessState) {
            list = state.getAllUserSubscriptionResponse;
            print('+++++++++++++++++++++++++++');
            print(list);
          }
        },
        builder: (context, state) {
          SubscriptionCubit cubit = SubscriptionCubit.get(context);
          //print('${list[list.length - 1]}');
          return Scaffold(
            backgroundColor: AppColorConstant.backgroundColor,
            body: SafeArea(
              child: Column(
                children: [
                  if (state is GetAllUserSubscriptionSuccessState && list.isNotEmpty)
                    BuildCurrentSubscriptionItem(
                      model: list.length > 1 ? list[list.length - 1] : list[0],
                    ),
                  if (state is GetAllUserSubscriptionSuccessState && list.isNotEmpty)
                    SizedBox(
                      height: 420.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        reverse: true,
                        itemBuilder: (context, index) =>
                             BuildSubscriptionItem(model: list[index]),
                        itemCount: list.length - 1,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class BuildSubscriptionItem extends StatelessWidget {
  final SubscriptionDataEntity model;


  const BuildSubscriptionItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    print(model.startsAt);
    print('--------------');
    print(model.endsAt);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .21,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.1),
              border: Border.all(color: Colors.black),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 7, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Type : ',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.bodyMediumStyle
                                        .copyWith(fontSize: 19.sp),
                                  ),
                                  Text(
                                    model.name == 'pro' ? 'ADVANCED' : 'BASIC',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.bodyMediumStyle.copyWith(
                                        fontSize: 19.sp,
                                        color: Colors.green[300]),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Price : ',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.bodyMediumStyle
                                        .copyWith(fontSize: 19.sp),
                                  ),
                                  Text(
                                    model.name == 'pro' ? '99.99\$' : '9.99\$',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.bodyMediumStyle.copyWith(
                                        fontSize: 19.sp,
                                        color: Colors.green[300]),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 8.0, left: 8),
                              child: Row(
                                children: [
                                  Text(
                                    'Started in : ',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.bodyMediumStyle
                                        .copyWith(fontSize: 19.sp),
                                  ),
                                  Text(
                                    model.createdAt,
                                    style: TextStyles.bodySmallStyle.copyWith(
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.green[300]),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 8.0, left: 8),
                              child: Row(
                                children: [
                                  Text(
                                    'Ended in : ',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.bodyMediumStyle
                                        .copyWith(fontSize: 19.sp),
                                  ),
                                  Text(
                                    model.endsAt,
                                    style: TextStyles.bodySmallStyle.copyWith(
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.green[300]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BuildCurrentSubscriptionItem extends StatelessWidget {
  final SubscriptionDataEntity model;

  const BuildCurrentSubscriptionItem({
    super.key,
    required this.model,
  });


  @override
  Widget build(BuildContext context) {
    print('current -');
    print(model.startsAt);
    print('--------------');
    print(model.endsAt);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .25,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.5),
          border: Border.all(color: Colors.black),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0, top: 10, left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Current Subscription',
                          style: TextStyles.bodyMediumStyle.copyWith(
                            fontSize: 25.sp,
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Type : ',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.bodyMediumStyle
                                    .copyWith(fontSize: 19.sp),
                              ),
                              Text(
                                model.name == 'basic' ? 'BASIC' : 'ADVANCED',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.bodyMediumStyle.copyWith(
                                    fontSize: 19.sp, color: Colors.green[300]),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Price : ',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.bodyMediumStyle
                                    .copyWith(fontSize: 19.sp),
                              ),
                              Text(
                                model.name == 'pro' ? '99.99\$' : '9.99\$',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.bodyMediumStyle.copyWith(
                                    fontSize: 19.sp, color: Colors.green[300]),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0, left: 8),
                          child: Row(
                            children: [
                              Text(
                                'Started in : ',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.bodyMediumStyle
                                    .copyWith(fontSize: 19.sp),
                              ),
                              Text(
                                model.createdAt,
                                style: TextStyles.bodySmallStyle.copyWith(
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.green[300]),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0, left: 8),
                          child: Row(
                            children: [
                              Text(
                                'Ended in : ',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.bodyMediumStyle
                                    .copyWith(fontSize: 19.sp),
                              ),
                              Text(
                                model.endsAt,
                                style: TextStyles.bodySmallStyle.copyWith(
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.green[300]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
