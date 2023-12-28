import 'package:elwarsha/core/global/widgets/show_flutter_toast.dart';
import 'package:elwarsha/winch/domain/usecase/winch_usecase.dart';
import 'package:elwarsha/winch/presentation/controller/winch_cubit/winch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../core/constant/app_constant_key.dart';
import '../../../core/global/widgets/order_details.dart';
import '../../../core/services/cache_helper.dart';
import '../../../core/services/service_locator.dart';
import '../components/open_map.dart';
import '../controller/winch_cubit/winch_state.dart';

class WinchServiceScreen extends StatefulWidget {
  const WinchServiceScreen({Key? key}) : super(key: key);

  @override
  State<WinchServiceScreen> createState() => _WinchServiceScreenState();
}

class _WinchServiceScreenState extends State<WinchServiceScreen> {
  var carDetailsController = TextEditingController();
  var problemsController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  Color mainColor = HexColor('#672323');
  Color secColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<WinchCubit>(),
      child: BlocConsumer<WinchCubit, WinchStates>(
        listener: (context, state) {
          if (state is SuccessMakeWinchOrderState) {
            showFlutterToast(
                message: state.makeWinchOrderResponse.message,
                state: ToastState.success);
          }
        },
        builder: (context, state) {
          WinchCubit cubit = WinchCubit.get(context);
          return Scaffold(
            backgroundColor:
            Colors.grey[900], //AppColorConstant.backgroundColor,
            body: SingleChildScrollView(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 250.h,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/car winch.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Form(
                        key: formKey,
                        child: Container(
                          width: double.infinity,
                          height: 430.h,
                          decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 20.0, left: 20, top: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20.h,
                                ),
                                SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height * .07,
                                  width: double.infinity,
                                  child: TextFormField(
                                    style: GoogleFonts.ubuntu(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp),
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Car type must be non empty';
                                      } else {
                                        return null;
                                      }
                                    },
                                    // maxLines: null,
                                    // expands: true,
                                    cursorColor: Colors.grey,
                                    controller: carDetailsController,
                                    decoration: InputDecoration(
                                      // filled: true,
                                      label: const Text('Car Type'),
                                      labelStyle: GoogleFonts.ubuntu(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.sp),
                                      fillColor: secColor,
                                      enabledBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height * .15,
                                  width: double.infinity,
                                  child: TextFormField(
                                    style: GoogleFonts.ubuntu(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp),
                                    maxLines: null,
                                    expands: true,
                                    cursorColor: Colors.white,
                                    controller: problemsController,
                                    decoration: InputDecoration(
                                      //filled: true,
                                      fillColor: Colors.red[900],
                                      label: const Text(
                                          'Write description for problem'),
                                      labelStyle: GoogleFonts.ubuntu(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.sp),
                                      enabledBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Container(
                                  width:
                                  MediaQuery.of(context).size.width * 0.6,
                                  decoration: BoxDecoration(
                                    color: secColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: MaterialButton(
                                    onPressed: () {
                                      ///todo open map to detect destination
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => OpenMapScreen(
                                              lat: CacheHelper.getDate(
                                                  key: AppConstantKey
                                                      .latitude),
                                              long: CacheHelper.getDate(
                                                  key: AppConstantKey
                                                      .longitude),
                                            )),
                                      );
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Map',
                                          style: GoogleFonts.ubuntu(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22.sp),
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Image.asset(
                                          'assets/images/map.png',
                                          width: 35,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                Container(
                                  width:
                                  MediaQuery.of(context).size.width * 0.6,
                                  decoration: BoxDecoration(
                                    color: secColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: MaterialButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          double? latTo = CacheHelper.getDate(key: AppConstantKey.latTo);
                                          print('+++++++');
                                          print(latTo);
                                          if(latTo == null){
                                            showFlutterToast(
                                              message: 'No destination selected!',
                                              state: ToastState.error,
                                            );
                                          }
                                          else{
                                            WinchParameter parameter =
                                            WinchParameter(
                                              token: CacheHelper.getDate(key: 'token'),
                                              carType: carDetailsController.text,
                                              lagFrom: CacheHelper.getDate(key: AppConstantKey.latitude),
                                              latFrom: CacheHelper.getDate(key: AppConstantKey.longitude),
                                              lagTo: CacheHelper.getDate(key: AppConstantKey.latTo),
                                              latTo: CacheHelper.getDate(key: AppConstantKey.longTo),
                                              description: problemsController.text,
                                              cityFrom: CacheHelper.getDate(key: AppConstantKey.getCityName),
                                              cityTo: CacheHelper.getDate(key: AppConstantKey.getCityNameDestination),
                                            );
                                            cubit.makeWinchOrder(
                                                parameter: parameter);
                                            showAlertDialog(
                                              context: context,
                                              description:
                                              problemsController.text,
                                              carType: carDetailsController.text,
                                              cityName: CacheHelper.getDate(key: AppConstantKey.getCityName),
                                              orderDetails: 'Car Winch',
                                            );
                                          }
                                        }
                                      },
                                      child: Text(
                                        'Order',
                                        style: GoogleFonts.ubuntu(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22.sp),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 240,
                    child: Container(
                      width: 360.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                      ),
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
