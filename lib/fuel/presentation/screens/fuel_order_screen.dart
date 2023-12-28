import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../core/constant/app_color_constant.dart';
import '../../../core/constant/app_constant_key.dart';
import '../../../core/global/widgets/order_details.dart';
import '../../../core/global/widgets/show_flutter_toast.dart';
import '../../../core/services/cache_helper.dart';
import '../../../core/services/service_locator.dart';
import '../../domain/usecase/fuel_usecase.dart';
import '../controller/car_fuel_cubit/fuel_cubit.dart';
import '../controller/car_fuel_cubit/fuel_state.dart';

class FuelOrderScreen extends StatefulWidget {
  const FuelOrderScreen({Key? key}) : super(key: key);

  @override
  State<FuelOrderScreen> createState() => _FuelOrderScreenState();
}

class _FuelOrderScreenState extends State<FuelOrderScreen> {
  bool isChecked1 = false;

  double value1 = 4;

  bool isChecked2 = false;

  bool isChecked3 = false;

  bool isChecked4 = false;

  bool isChecked5 = false;

  String paymentMethod = '';

  Color? mainColor = HexColor('#672323');

  Color secColor = Colors.black;

  final TextEditingController carDetailsController = TextEditingController();

  final TextEditingController problemsController = TextEditingController();

  final GlobalKey formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<FuelCubit>(),
      child: BlocConsumer<FuelCubit, FuelStates>(
        listener: (context, state) {
          if (state is SuccessMakeFuelOrderState) {
            showFlutterToast(
                message: state.makeFuelOrderResponse.message,
                state: ToastState.success);
          }
          if (state is ErrorMakeFuelOrderState) {
            showFlutterToast(
                message: state.errorMessage, state: ToastState.error);
          }
        },
        builder: (context, state) {
          FuelCubit cubit = FuelCubit.get(context);
          return Scaffold(
            backgroundColor: AppColorConstant.backgroundColor,
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
                            image: AssetImage(
                                'assets/images/car electricity & fuel.jpeg'),
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/ectricity icon.png',
                                      width: 50.w,
                                    ),
                                    Checkbox(
                                      value: isChecked1,
                                      hoverColor: Colors.white,
                                      focusColor: Colors.white,
                                      checkColor: Colors.white,
                                      activeColor: secColor,
                                      //tristate: true,
                                      onChanged: (value) {
                                        setState(() {
                                          if (isChecked2) {
                                            isChecked2 = false;
                                          }
                                          isChecked1 = value!;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 90.w,
                                    ),
                                    Image.asset(
                                      'assets/images/gasoline icon.png',
                                      width: 50.w,
                                    ),
                                    Checkbox(
                                      value: isChecked2,
                                      hoverColor: Colors.white,
                                      focusColor: Colors.white,
                                      checkColor: Colors.white,
                                      activeColor: secColor,
                                      //tristate: true,
                                      onChanged: (value) {
                                        setState(() {
                                          if (isChecked1) {
                                            isChecked1 = false;
                                          }
                                          isChecked2 = value!;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 7.h,
                                ),
                                if (isChecked2)
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '80',
                                            style: TextStyle(
                                              fontSize: 25.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Checkbox(
                                            value: isChecked3,
                                            hoverColor: Colors.white,
                                            focusColor: Colors.white,
                                            checkColor: Colors.white,
                                            activeColor: secColor,
                                            //tristate: true,
                                            onChanged: (value) {
                                              setState(() {
                                                if (isChecked4 || isChecked5) {
                                                  isChecked4 = false;
                                                  isChecked5 = false;
                                                }
                                                isChecked3 = value!;
                                              });
                                            },
                                          ),
                                          SizedBox(
                                            width: 25.w,
                                          ),
                                          Text(
                                            '92',
                                            style: TextStyle(
                                              fontSize: 25.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Checkbox(
                                            value: isChecked4,
                                            hoverColor: Colors.white,
                                            focusColor: Colors.white,
                                            checkColor: Colors.white,
                                            activeColor: secColor,
                                            //tristate: true,
                                            onChanged: (value) {
                                              setState(() {
                                                if (isChecked3 || isChecked5) {
                                                  isChecked3 = false;
                                                  isChecked5 = false;
                                                }
                                                isChecked4 = value!;
                                              });
                                            },
                                          ),
                                          SizedBox(
                                            width: 25.w,
                                          ),
                                          const Text(
                                            '95',
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Checkbox(
                                            value: isChecked5,
                                            hoverColor: Colors.white,
                                            focusColor: Colors.white,
                                            checkColor: Colors.white,
                                            activeColor: secColor,
                                            //tristate: true,
                                            onChanged: (value) {
                                              setState(() {
                                                if (isChecked3 || isChecked4) {
                                                  isChecked3 = false;
                                                  isChecked4 = false;
                                                }
                                                isChecked5 = value!;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      if (isChecked3 ||
                                          isChecked4 ||
                                          isChecked5)
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Slider(
                                              activeColor: Colors.white,
                                              inactiveColor: secColor,
                                              min: 4,
                                              max: 64,
                                              label: 'Litter',
                                              thumbColor: Colors.white,
                                              value: value1,
                                              onChanged: (value) {
                                                setState(() {
                                                  value1 = value;
                                                });
                                              },
                                            ),
                                            Text(
                                              '${value1.toInt()} L',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 22.sp),
                                            )
                                          ],
                                        ),
                                    ],
                                  ),
                                SizedBox(
                                  height: 20.h,
                                ),
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
                                        if (isChecked1) {
                                          FuelParameter parameter =
                                              FuelParameter(
                                            token: CacheHelper.getDate(
                                                key: 'token'),
                                            carType: carDetailsController.text,
                                            lag: CacheHelper.getDate(key: AppConstantKey.latitude),
                                            lat: CacheHelper.getDate(key: AppConstantKey.longitude),
                                            description: problemsController.text,
                                            city: CacheHelper.getDate(key: AppConstantKey.getCityName),
                                            b92: null,
                                            b90: null,
                                            b80: null,
                                            electricity: 1,
                                            b95: null,
                                          );
                                          cubit.makeFuelOrder(
                                            parameter: parameter,
                                          );

                                          showAlertDialog(
                                            context: context,
                                            description:
                                                problemsController.text,
                                            carType: carDetailsController.text,
                                            cityName: CacheHelper.getDate(
                                                key:
                                                    AppConstantKey.getCityName),
                                            orderDetails: 'Electric charge',
                                          );
                                        }
                                        else if (isChecked2) {
                                          List<double> liters = [0, 0, 0];
                                          if (isChecked3) {
                                            liters[0] = value1;
                                            showAlertDialog(
                                              context: context,
                                              description:
                                              problemsController.text,
                                              carType:
                                              carDetailsController.text,
                                              cityName: CacheHelper.getDate(
                                                  key: AppConstantKey
                                                      .getCityName),
                                              orderDetails:
                                              '${liters[0].toInt()} Liters B80',
                                            );
                                          }
                                          if (isChecked4) {
                                            liters[1] = value1;
                                            showAlertDialog(
                                              context: context,
                                              description:
                                              problemsController.text,
                                              carType:
                                              carDetailsController.text,
                                              cityName: CacheHelper.getDate(
                                                  key: AppConstantKey
                                                      .getCityName),
                                              orderDetails:
                                              '${liters[1].toInt()} Liters B92',
                                            );
                                          }
                                          if (isChecked5) {
                                            liters[2] = value1;
                                            showAlertDialog(
                                              context: context,
                                              description:
                                              problemsController.text,
                                              carType:
                                              carDetailsController.text,
                                              cityName: CacheHelper.getDate(
                                                  key: AppConstantKey
                                                      .getCityName),
                                              orderDetails:
                                              '${liters[2].toInt()} Liters B95',
                                            );
                                          }

                                          FuelParameter parameter =
                                              FuelParameter(
                                            token: CacheHelper.getDate(
                                                key: 'token'),
                                            carType: carDetailsController.text,
                                            lag: CacheHelper.getDate(
                                                key: AppConstantKey.latitude),
                                            lat: CacheHelper.getDate(
                                                key: AppConstantKey.longitude),
                                            description:
                                                problemsController.text,
                                            city: CacheHelper.getDate(
                                                key:
                                                    AppConstantKey.getCityName),
                                            b92: liters[1].toDouble(),
                                            b90: null,
                                            b80: liters[0].toDouble(),
                                            electricity: 0,
                                            b95: liters[2].toDouble(),
                                          );
                                          cubit.makeFuelOrder(
                                            parameter: parameter,
                                          );
                                        } else {
                                          showFlutterToast(
                                            message: 'No service selected!',
                                            state: ToastState.error,
                                          );
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
