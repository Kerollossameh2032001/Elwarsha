import 'package:elwarsha/car_wash/presetation/controller/car_wash_cubit/wash_cubit.dart';
import 'package:elwarsha/core/constant/app_constant_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../core/constant/app_color_constant.dart';
import '../../../core/global/widgets/order_details.dart';
import '../../../core/global/widgets/show_flutter_toast.dart';
import '../../../core/services/cache_helper.dart';
import '../../../core/services/service_locator.dart';
import '../../domain/usecase/wash_usecase.dart';
import '../controller/car_wash_cubit/wash_state.dart';

class CarWashOrderScreen extends StatefulWidget {
  CarWashOrderScreen({Key? key}) : super(key: key);

  @override
  State<CarWashOrderScreen> createState() => _CarWashOrderScreenState();
}

class _CarWashOrderScreenState extends State<CarWashOrderScreen> {
  var carDetailsController = TextEditingController();
  var problemsController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  Color mainColor = HexColor('#672323');
  Color secColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<WashCubit>(),
      child: BlocConsumer<WashCubit, WashStates>(
        listener: (context, state) {
          if (state is SuccessMakeWashOrderState) {
            showFlutterToast(
                message: state.makeWashOrderResponse.message,
                state: ToastState.success);
          }
          if (state is ErrorMakeWashOrderState) {
            showFlutterToast(
                message: state.errorMessage, state: ToastState.error);
            print("${state.errorMessage}");
          }
        },
        builder: (context, state) {
          WashCubit cubit = WashCubit.get(context);
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
                            image: AssetImage('assets/images/car washing.jpeg'),
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
                                        if (formKey.currentState!.validate()) {
                                          WashParameter parameter =
                                              WashParameter(
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
                                          );
                                          print(parameter.toString());
                                          cubit.makeWashOrder(
                                              parameter: parameter);
                                          showAlertDialog(
                                            context: context,
                                            description:
                                                problemsController.text,
                                            carType: carDetailsController.text,
                                            cityName: CacheHelper.getDate(key: AppConstantKey.getCityName),
                                            orderDetails: 'Car Wash',
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
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40),
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
