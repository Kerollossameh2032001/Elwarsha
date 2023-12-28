import 'package:elwarsha/core/global/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/app_string_constants.dart';
import '../components/otp_components/verify_code_body.dart';
import '../controller/login_cubit/login_cubit.dart';

class OtpScreen extends StatelessWidget {
  final LoginCubit cubit;

  OtpScreen({Key? key, required this.cubit}) : super(key: key);
  final codeController1 = TextEditingController();
  final codeController2 = TextEditingController();
  final codeController3 = TextEditingController();
  final codeController4 = TextEditingController();
  final codeController5 = TextEditingController();
  final codeController6 = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStringConstant.appTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Be safe with us',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              VerifyCodeBody(
                  formKey: formKey,
                  codeController1: codeController1,
                  codeController2: codeController2,
                  codeController3: codeController3,
                  codeController4: codeController4,
                  codeController5: codeController5,
                  codeController6: codeController6),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  //vertical: 25.0.h,
                  horizontal: MediaQuery.of(context).size.width * 0.3,
                ),
                child: CustomButton(
                  onPressed: () {
                    String allControllers =
                        "${codeController1.text}${codeController2.text}${codeController3.text}${codeController4.text}${codeController5.text}${codeController6.text}";
                    /*if (formKey.currentState!.validate()) {
                          print(AppVariableConstants.saveVerificationId);
                          print("------------------------------------------------");
                          if (allControllers ==
                              AppVariableConstants.saveVerificationId) {
                            showFlutterToast(
                                message: 'Success', state: ToastState.success);
                          } else {
                            showFlutterToast(
                                message: 'Invalid phone number',
                                state: ToastState.error);
                          }
                        }*/
                    if (formKey.currentState!.validate()) {
                      cubit.confirmVerificationCode(
                        smsCode: allControllers,
                      );
                    }
                  },
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'Login',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              )
              // Container(
              //   width: MediaQuery.of(context).size.width * 0.8,
              //   decoration: BoxDecoration(
              //       color: Colors.white70,
              //       borderRadius: BorderRadius.circular(0),
              //       border: Border.all(color: Colors.black)),
              //   child: MaterialButton(
              //       onPressed: () {
              //         String allControllers =
              //             "${codeController1.text}${codeController2.text}${codeController3.text}${codeController4.text}${codeController5.text}${codeController6.text}";
              //         /*if (formKey.currentState!.validate()) {
              //           print(AppVariableConstants.saveVerificationId);
              //           print("------------------------------------------------");
              //           if (allControllers ==
              //               AppVariableConstants.saveVerificationId) {
              //             showFlutterToast(
              //                 message: 'Success', state: ToastState.success);
              //           } else {
              //             showFlutterToast(
              //                 message: 'Invalid phone number',
              //                 state: ToastState.error);
              //           }
              //         }*/
              //         if (formKey.currentState!.validate()) {
              //           cubit.confirmVerificationCode(
              //             smsCode: allControllers,
              //           );
              //         }
              //       },
              //       child: const Text(
              //         'Login',
              //         style: TextStyle(
              //             color: Colors.black,
              //             fontWeight: FontWeight.bold,
              //             fontSize: 22),
              //       )),
              //),
            ],
          ),
        ),
      ),
    );
  }
}
