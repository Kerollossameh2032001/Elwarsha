import 'package:elwarsha/core/constant/app_constant_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../core/global/widgets/order_details.dart';
import '../../../core/global/widgets/show_flutter_toast.dart';
import '../../../core/services/cache_helper.dart';
import '../../../core/services/service_locator.dart';
import '../../domain/usecase/repair_usecase.dart';
import '../controllers/repair_cubit/repair_cubit.dart';
import '../controllers/repair_cubit/repair_state.dart';

class RepairOrderScreen extends StatefulWidget {
  RepairOrderScreen({Key? key}) : super(key: key);

  @override
  State<RepairOrderScreen> createState() => _RepairOrderScreenState();
}

class _RepairOrderScreenState extends State<RepairOrderScreen> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  var carDetailsController = TextEditingController();
  var problemsController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  Color mainColor = HexColor('#672323');
  Color secColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RepairCubit>(),
      child: BlocConsumer<RepairCubit, RepairStates>(
        listener: (context, state) {
          if (state is SuccessMakeRepairOrderState) {
            showFlutterToast(
                message: state.makeRepairOrderResponse.message,
                state: ToastState.success);
            print(
                "Kero: object => ${state.makeRepairOrderResponse.services}");
          }
        },
        builder: (context, state) {
          RepairCubit cubit = RepairCubit.get(context);
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
                            image: AssetImage(
                                'assets/images/car repair shop.jpeg'),
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
                                    SizedBox(
                                      height: 65.h,
                                      width: 65.w,
                                      child: Image.asset(
                                        'assets/images/broken ectricity icon.png',
                                        fit: BoxFit.fill,
                                      ),
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
                                          isChecked1 = value!;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 25.w,
                                    ),
                                    Image.asset(
                                      'assets/images/tire.png',
                                      width: 35.w,
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
                                          isChecked2 = value!;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 25.w,
                                    ),
                                    Image.asset(
                                      'assets/images/repair.png',
                                      width: 35.w,
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
                                          isChecked3 = value!;
                                        });
                                      },
                                    ),
                                  ],
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
                                        List<int> subService = [];

                                        if (formKey.currentState!.validate()) {
                                        if(isChecked1) {
                                          subService.add(1);
                                          showAlertDialog(
                                            context: context,
                                            description:
                                            problemsController.text,
                                            carType: carDetailsController.text,
                                            cityName: CacheHelper.getDate(key: AppConstantKey.getCityName),
                                            orderDetails: 'Repair electricity',
                                          );

                                        };
                                        if(isChecked2) {
                                          subService.add(2);
                                          showAlertDialog(
                                            context: context,
                                            description:
                                            problemsController.text,
                                            carType: carDetailsController.text,
                                            cityName: CacheHelper.getDate(key: AppConstantKey.getCityName),
                                            orderDetails: 'Repair tires',
                                          );
                                        }
                                        if(isChecked3) {
                                          subService.add(3);
                                          showAlertDialog(
                                            context: context,
                                            description:
                                            problemsController.text,
                                            carType: carDetailsController.text,
                                            cityName: CacheHelper.getDate(key: AppConstantKey.getCityName),
                                            orderDetails: 'Repair mechanical ',
                                          );
                                        }
                                          if(isChecked1||isChecked2||isChecked3){
                                            RepairParameter parameter =
                                            RepairParameter(
                                              token: CacheHelper.getDate(key: 'token'),
                                              carType: carDetailsController.text,
                                              lag: CacheHelper.getDate(key: AppConstantKey.latitude),
                                              lat: CacheHelper.getDate(key: AppConstantKey.longitude),
                                              description: problemsController.text,
                                              city: CacheHelper.getDate(key: AppConstantKey.getCityName),
                                              repairService: subService,
                                            );
                                            cubit.makeRepairOrder(
                                                parameter: parameter);
                                          }else{
                                            showFlutterToast(
                                              message: 'No service selected!',
                                              state: ToastState.error,
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
