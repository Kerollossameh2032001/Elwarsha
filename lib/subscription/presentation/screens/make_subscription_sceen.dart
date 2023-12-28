import 'package:elwarsha/core/global/widgets/navigate_to.dart';
import 'package:elwarsha/core/global/widgets/show_flutter_toast.dart';
import 'package:elwarsha/core/services/cache_helper.dart';
import 'package:elwarsha/layout/presentation/controller/layout_cubit/layout_cubit.dart';
import 'package:elwarsha/layout/presentation/screens/layout_screen.dart';
import 'package:elwarsha/subscription/domain/usecase/get_all_subscription_usecase.dart';
import 'package:elwarsha/subscription/domain/usecase/make_subscription_usecase.dart';
import 'package:elwarsha/subscription/domain/usecase/renew_subscription_usecase.dart';
import 'package:elwarsha/subscription/presentation/controller/subscription_cubit/subscription_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../core/global/widgets/custom_dialog.dart';
import '../../../core/services/service_locator.dart';
import '../../../payment/modules/payment/toggle_screen.dart';
import '../controller/subscription_cubit/subscription_state.dart';

class MakeSubscriptionScreen extends StatefulWidget {
  const MakeSubscriptionScreen({Key? key, required this.userPhone}) : super(key: key);
  final String userPhone;

  @override
  State<MakeSubscriptionScreen> createState() => _MakeSubscriptionScreenState();
}

class _MakeSubscriptionScreenState extends State<MakeSubscriptionScreen> {

  bool isSelected1 = false;

  bool isSelected2 = false;

  double fontSize = 12;

  Color colorBase = Colors.white;

  Color colorAdvance = Colors.black;

  void toggleColors1() {
    setState(() {
      isSelected1 = !isSelected1;
      if (isSelected1 == true) {
        isSelected2 = false;
      }
    });
  }

  void toggleColors2() {
    setState(() {
      isSelected2 = !isSelected2;
      if (isSelected2 == true) {
        isSelected1 = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SubscriptionCubit>(),
      child: BlocConsumer<SubscriptionCubit, SubscriptionStates>(
        listener: (context, state) {
          if (state is SuccessMakeSubscriptionState) {
            showFlutterToast(
                message: state.makeSubscriptionResponse.message,
                state: ToastState.success);
          }
          //Payment
          if (state is PaymentOrderIdLoadingStates) {
            customDialog(context: context);
          }
          if (state is PaymentOrderIdSuccessStates) {
            navigateTo(context: context, destination: const ToggleScreen());
          }

          if (state is ErrorMakeSubscriptionState) {
            showFlutterToast(
                message: state.errorMessage, state: ToastState.success);
          }
          if (state is GetAllUserSubscriptionSuccessState) {
            showFlutterToast(
                message: state.getAllUserSubscriptionResponse.length.toString(),
                state: ToastState.success);
          }
          if (state is GetAllUserSubscriptionErrorState) {
            showFlutterToast(
                message: state.errorMessage, state: ToastState.error);
          }
          if (state is RenewSubscriptionSuccessState) {
            showFlutterToast(
                message: state.renewSubscriptionResponse.message,
                state: ToastState.success);
          }
          if (state is RenewSubscriptionErrorState) {
            showFlutterToast(
                message: state.errorMessage, state: ToastState.error);
          }
        },
        builder: (context, state) {
          SubscriptionCubit cubit = SubscriptionCubit.get(context);
          return Scaffold(
            backgroundColor: HexColor('#414142'),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Start your subscription'.toUpperCase(),
                            style: GoogleFonts.ubuntu(
                                color: Colors.green[600],
                                fontWeight: FontWeight.bold,
                                fontSize: 17.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            'Select between two plan',
                            style: GoogleFonts.ubuntu(
                              color: Colors.grey[500],
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                toggleColors1();
                              },
                              child: Container(
                                height: 450.h,
                                width: 160.w,
                                decoration: BoxDecoration(
                                    color: Colors.grey[700],
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(30),
                                        topLeft: Radius.circular(30)),
                                    border: Border.all(
                                      color:
                                      isSelected1 ? Colors.green : Colors.black,
                                      width: 2.5,
                                    )),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 15.0,
                                        bottom: 10,
                                      ),
                                      child: Text(
                                        'BASIC',
                                        style: GoogleFonts.ubuntu(
                                          color: colorBase,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ),
                                    myDivider(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 10.0,
                                        left: 10,
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.check,
                                                color: Colors.green,
                                              ),
                                              Text(
                                                'Winch'.toUpperCase(),
                                                style: GoogleFonts.ubuntu(
                                                  color: colorBase,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: fontSize.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          myDivider(),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.check,
                                                color: Colors.green,
                                              ),
                                              Text(
                                                'Wash car'.toUpperCase(),
                                                style: GoogleFonts.ubuntu(
                                                  color: colorBase,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: fontSize.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          myDivider(),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.check,
                                                color: Colors.green,
                                              ),
                                              Text(
                                                'Fuel & electricity'.toUpperCase(),
                                                style: GoogleFonts.ubuntu(
                                                  color: colorBase,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: fontSize.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          myDivider(),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.check,
                                                color: Colors.green,
                                              ),
                                              Text(
                                                'Repair'.toUpperCase(),
                                                style: GoogleFonts.ubuntu(
                                                  color: colorBase,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: fontSize.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          myDivider(),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              const Icon(
                                                Icons.info_outline,
                                                color: Colors.green,
                                                size: 20,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  '1 Month + 15 Days for free'
                                                      .toUpperCase(),
                                                  style: GoogleFonts.ubuntu(
                                                    color: colorBase,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: fontSize.sp,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          myDivider(),
                                          Center(
                                            child: Text(
                                              '9.99\$',
                                              style: GoogleFonts.ubuntu(
                                                  color: colorBase,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 35.sp),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                toggleColors2();
                              },
                              child: Container(
                                height: 450.h,
                                width: 160.w,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.yellow,
                                      HexColor('#feb526'),
                                    ],
                                    begin: Alignment.topLeft,
                                  ),
                                  color: Colors.red,
                                  borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                  border: Border.all(
                                    color: isSelected2 == true
                                        ? Colors.green
                                        : Colors.black,
                                    width: 2.5,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 15.0,
                                        bottom: 10,
                                      ),
                                      child: Text(
                                        'advanced'.toUpperCase(),
                                        style: GoogleFonts.ubuntu(
                                            color: colorAdvance,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp),
                                      ),
                                    ),
                                    myDivider(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 10.0,
                                        left: 10,
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.check,
                                                color: Colors.green,
                                              ),
                                              Text(
                                                'Winch'.toUpperCase(),
                                                style: GoogleFonts.ubuntu(
                                                  color: colorAdvance,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: fontSize.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          myDivider(),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.check,
                                                color: Colors.green,
                                              ),
                                              Text(
                                                'Wash car'.toUpperCase(),
                                                style: GoogleFonts.ubuntu(
                                                  color: colorAdvance,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: fontSize.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          myDivider(),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.check,
                                                color: Colors.green,
                                              ),
                                              Text(
                                                'Fuel & electricity'.toUpperCase(),
                                                style: GoogleFonts.ubuntu(
                                                  color: colorAdvance,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: fontSize.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          myDivider(),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.check,
                                                color: Colors.green,
                                              ),
                                              Text(
                                                'Repair'.toUpperCase(),
                                                style: GoogleFonts.ubuntu(
                                                  color: colorAdvance,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: fontSize.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          myDivider(),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              const Icon(
                                                Icons.info_outline,
                                                color: Colors.green,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  '1 year + 1 month for free'
                                                      .toUpperCase(),
                                                  style: GoogleFonts.ubuntu(
                                                    color: colorAdvance,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: fontSize.sp,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          myDivider(),
                                          Center(
                                            child: Text(
                                              '99.99\$',
                                              style: GoogleFonts.ubuntu(
                                                  color: colorAdvance,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 35.sp),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            decoration: BoxDecoration(
                              color: Colors.green[600],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: MaterialButton(
                                onPressed: () {
                                  if (isSelected1) {
                                    print('Basic');
                                    MakeSubscriptionParameter parameter =
                                    MakeSubscriptionParameter(
                                      token: CacheHelper.getDate(key: 'token'),
                                      planeId: 1,
                                    );
                                    cubit.makeSubscription(parameter: parameter);
                                    //navigateToAndReplacement(context: context, destination: const LayoutScreen());
                                    //LayoutCubit.get(context).isSubscribed = true;
                                    cubit.getOrderRegistrationID(price: '1000', phone: widget.userPhone);
                                  }
                                  if (isSelected2) {
                                    print('Advanced');
                                    MakeSubscriptionParameter parameter =
                                    MakeSubscriptionParameter(
                                      token: CacheHelper.getDate(key: 'token'),
                                      planeId: 2,
                                    );
                                    cubit.makeSubscription(parameter: parameter);
                                    //navigateTo(context: context, destination: const ToggleScreen());
                                    //LayoutCubit.get(context).isSubscribed = true;
                                    cubit.getOrderRegistrationID(price: '10000', phone: widget.userPhone);
                                  }
                                },
                                child: Text(
                                  'subscribe'.toUpperCase(),
                                  style: GoogleFonts.ubuntu(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22.sp),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget myDivider() => const Padding(
  padding: EdgeInsets.only(
    left: 8.0,
    right: 8.0,
    top: 10,
    bottom: 10,
  ),
  child: Divider(
    color: Colors.grey,
  ),
);













/*ElevatedButton(
child: const Text("Get All User Subscription"),
onPressed: () {
AllUserSubscriptionsParameter parameter =
AllUserSubscriptionsParameter(
token: CacheHelper.getDate(key: 'token'),
);
cubit.getAllUserSubscription(parameter: parameter);
},
),
ElevatedButton(
child: const Text("Renew User Subscription"),
onPressed: () {
RenewSubscriptionParameter parameter =
RenewSubscriptionParameter(
token: CacheHelper.getDate(key: 'token'),
);
cubit.renewSubscription(parameter: parameter);
navigateTo(context: context, destination: LayoutScreen());
//LayoutCubit.get(context).isSubscribed = true;
},
),*/
