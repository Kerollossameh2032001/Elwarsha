import 'package:elwarsha/authentication/domain/usecase/login_usecase.dart';
import 'package:elwarsha/authentication/presentation/controller/login_cubit/login_cubit.dart';
import 'package:elwarsha/core/constant/app_constant_key.dart';
import 'package:elwarsha/core/constant/app_path_constant.dart';
import 'package:elwarsha/core/global/widgets/custom_button.dart';
import 'package:elwarsha/core/global/widgets/navigate_to.dart';
import 'package:elwarsha/core/notification/push_notification_service.dart';
import 'package:elwarsha/layout/presentation/screens/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constant/app_color_constant.dart';
import '../../../core/constant/app_string_constants.dart';
import '../../../core/global/widgets/show_flutter_toast.dart';
import '../../../core/services/cache_helper.dart';
import '../../../core/services/service_locator.dart';
import '../controller/login_cubit/login_states.dart';
import 'otp_code_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) async {
          LoginCubit cubit = LoginCubit.get(context);

          if (state is SendVerifyCodeLoadingState) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            );
          } else if (state is SendVerifyCodeErrorState) {
            showFlutterToast(
                message: state.errorMessage, state: ToastState.error);
            Navigator.of(context).pop();
          } else if (state is SendVerifyCodeSuccessState) {
            showFlutterToast(
                message: 'Code was Send as SMS', state: ToastState.success);
            //Navigator.of(context).pop();
            //print("KErollososoosososoososo ${state.verificationId}");

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => OtpScreen(
                  cubit: cubit,
                ),
              ),
            );
          }

          if (state is ConfirmVerifyCodeLoadingState) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            );
          } else if (state is ConfirmVerifyCodeErrorState) {
            showFlutterToast(
              message: state.errorMessage,
              state: ToastState.error,
            );
            Navigator.of(context).pop();
          } else if (state is ConfirmVerifyCodeSuccessState)  {
            PushNotificationService.init(context);
            LoginParameter parameter = LoginParameter(
                phone: phoneController.text,
                deviceToken: await PushNotificationService.getDeviceToken()??'');//CacheHelper.getDate(key: AppConstantKey.getTokenDevice));
            LoginCubit.get(context).login(parameter: parameter);
          }

          if (state is LoginSuccessState) {
            Navigator.of(context).pop();
            //Login To database and saving the token
            CacheHelper.saveData(
                    key: "token", value: state.userData.accessToken)
                .then((value) {
              print("The Access Token is saved:  ${value}");
              print("The Access Token is  ${state.userData.accessToken}");
              print("The name is  ${state.userData.data.name}");
              print("The phone is  ${state.userData.data.phone}");
              navigateTo(context: context, destination: LayoutScreen());
              showFlutterToast(
                  message: 'Login Successfully', state: ToastState.success);
            }).catchError((error) {
              showFlutterToast(
                  message: 'Error While Saving Token: ${error.toString()}',
                  state: ToastState.error);
              //navigateTo(context: context, destination: LoginScreen());
            });
          } else if (state is LoginLoadingState) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            );
          } else if (state is LoginErrorState) {
            Navigator.of(context).pop();
            showFlutterToast(
              message: state.errorMessage,
              state: ToastState.error,
            );
          }
        },
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      AppStringConstant.appTitle,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'Be safe with Us',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Form(
                      key: formKey,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.65,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage(AppPathConstant.splashBackground),
                              fit: BoxFit.cover),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.30,
                            horizontal: 30,
                          ),
                          child: TextFormField(
                            cursorColor:
                                Theme.of(context).textTheme.bodyLarge!.color,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 25),
                            decoration: InputDecoration(
                              hintText: AppStringConstant.loginHintText,
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                      color: AppColorConstant.primaryColor),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColorConstant.primaryColor,
                                ),
                              ),
                              enabled: true,
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            validator: (String? value) {
                              if (value!.length < 11) {
                                return 'Invalid phone number';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 25.0,
                        horizontal: MediaQuery.of(context).size.width * 0.3,
                      ),
                      child: CustomButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            String num = '+20${phoneController.text}';
                            CacheHelper.saveData(
                                key:
                                    AppStringConstant.cacheHelperSaveUserNumber,
                                value: num);
                            //print(num);

                            cubit.sendVerificationCode(phoneNumber: num);
                          }
                        },
                        color: AppColorConstant.primaryColor,
                        child: Text('Confirm',
                            style: Theme.of(context).textTheme.labelMedium),
                      ),
                    )
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
