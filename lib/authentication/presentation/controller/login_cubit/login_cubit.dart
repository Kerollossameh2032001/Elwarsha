import 'package:bloc/bloc.dart';
import 'package:elwarsha/authentication/domain/usecase/send_verfy_code_usecase.dart';
import 'package:elwarsha/core/constant/app_variable_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../payment/core/network/constant.dart';
import '../../../../payment/core/network/dio.dart';
import '../../../../payment/models/authentication_request_model.dart';
import '../../../domain/usecase/confirm_verify_code.dart';
import '../../../domain/usecase/login_usecase.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  final LoginUseCase loginUseCase;
  final SendVerifyCodeUseCase sendVerifyCodeUseCase;
  final ConfirmVerifyCodeUseCase confirmVerifyCodeUseCase;

  LoginCubit(this.loginUseCase, this.sendVerifyCodeUseCase,
      this.confirmVerifyCodeUseCase)
      : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool obscureText = true;
  IconData visibility = Icons.visibility_off_outlined;

  /*void changeVisibility() {
    obscureText = !obscureText;
    visibility =
        obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    obscureText
        ? emit(LoginDisActiveVisibilityState())
        : emit(LoginActiveVisibilityState());
  }*/

  void login({
    required LoginParameter parameter,
  }) async {
    emit(LoginLoadingState());
    var result = await loginUseCase(parameter);
    result.fold(
      (l) => emit(LoginErrorState(errorMessage: l.message)),
      (r) => emit(LoginSuccessState(userData: r)),
    );
  }

  void sendVerificationCode({
    required String phoneNumber,
  }) async {
    emit(SendVerifyCodeLoadingState());
    SendPhoneNumberParameter parameter =
        SendPhoneNumberParameter(phoneNumber: phoneNumber);
    var result = await sendVerifyCodeUseCase(parameter);
    result.fold(
      (l) => emit(SendVerifyCodeErrorState(errorMessage: l.message)),
      (r) => emit(SendVerifyCodeSuccessState()),
    );
  }

  void confirmVerificationCode({
    required String smsCode,
  }) async {
    emit(ConfirmVerifyCodeLoadingState());
    ConfirmCodeParameter parameter = ConfirmCodeParameter(
      verificationId: AppVariableConstants.saveVerificationId!,
      smsCode: smsCode,
    );

    var result = await confirmVerifyCodeUseCase(parameter);
    result.fold(
      (l) => emit(ConfirmVerifyCodeErrorState(errorMessage: l.message)),
      (r) => emit(ConfirmVerifyCodeSuccessState(credential: r)),
    );
  }



}
